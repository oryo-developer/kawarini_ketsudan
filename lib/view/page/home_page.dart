import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kawarini_ketsudan/controller/decisions_controller.dart';
import 'package:kawarini_ketsudan/controller/home_page_controller.dart';
import 'package:kawarini_ketsudan/controller/options_controller.dart';
import 'package:kawarini_ketsudan/extension/text_editing_controller_extension.dart';
import 'package:kawarini_ketsudan/model/decision_model.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';
import 'package:kawarini_ketsudan/view/theme/my_text_style.dart';
import 'package:marquee_widget/marquee_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageProvider);
    final controller = ref.read(homePageProvider.notifier);

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: state.bottomSheetVisible ? 66 : 16,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColor.amber, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: state.optionsVisible ? _options() : _decisions(),
              ),
            ),
            Visibility(
              visible: !state.optionsVisible,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.show(),
                  child: const Text('決断'),
                ),
              ),
            ),
          ]),
        ),
        bottomSheet: _bottomSheet(),
      ),
    );
  }

  Widget _decisions() {
    return HookConsumer(builder: (context, ref, child) {
      final controller = ref.read(homePageProvider.notifier);

      final decisions = ref.watch(decisionsProvider);

      return Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '〜　今までの決断(${decisions.length})　〜',
            style: MyTextStyle.black20,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: decisions.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => controller.show(options: decisions[index].options),
              child: _decision(decisions[index]),
            ),
          ),
        ),
      ]);
    });
  }

  Widget _decision(Decision decision) {
    return HookConsumer(builder: (context, ref, child) {
      final controller = ref.read(decisionsProvider.notifier);

      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyColor.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(children: [
            Expanded(child: Text(decision.option, style: MyTextStyle.white20)),
            _closeButton(
              onPressed: () => controller.delete(decision: decision),
            ),
          ]),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Marquee(
              pauseDuration: const Duration(seconds: 2),
              animationDuration: const Duration(seconds: 3),
              backDuration: const Duration(seconds: 3),
              forwardAnimation: Curves.easeInOut,
              backwardAnimation: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: decision.options.map(
                    (option) {
                      return OrientationBuilder(
                        builder: (context, orientation) {
                          final width = MediaQuery.of(context).size.width;
                          return _option(
                            width: width / 3,
                            option: option,
                            paddingRight: 8,
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }

  Widget _options() {
    return HookConsumer(builder: (context, ref, child) {
      final state = ref.watch(homePageProvider);

      final options = ref.watch(optionsProvider);
      final controller = ref.read(optionsProvider.notifier);

      return Center(
        child: SingleChildScrollView(
          controller: state.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: options.asMap().entries.map((entry) {
                return _option(
                  option: entry.value,
                  onPressed: () => controller.remove(index: entry.key),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  Widget _option({
    double? width,
    required String option,
    VoidCallback? onPressed,
    double? paddingRight,
  }) {
    return Container(
      margin: EdgeInsets.only(right: paddingRight ?? 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColor.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width ?? double.infinity),
            child: Text(
              option,
              style: paddingRight == null
                  ? MyTextStyle.whiteClip
                  : MyTextStyle.white,
            ),
          ),
        ),
        _closeButton(visible: onPressed != null, onPressed: onPressed),
      ]),
    );
  }

  Widget _bottomSheet() {
    return HookConsumer(builder: (context, ref, child) {
      final state = ref.watch(homePageProvider);
      final controller = ref.read(homePageProvider.notifier);

      final options = ref.watch(optionsProvider);

      final textEditingController = useTextEditingController();
      final clearButtonVisible = useState(false);

      useEffect(() {
        return textEditingController.addAndRemoveListener(() {
          clearButtonVisible.value = textEditingController.text.isNotEmpty;
        });
      }, [textEditingController]);

      return Visibility(
        visible: state.bottomSheetVisible,
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: MyColor.amber,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: SafeArea(
            child: Row(children: [
              TextButton(
                onPressed: () {
                  textEditingController.clear();
                  controller.hide();
                },
                child: const Text('やめる'),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: MyColor.darkAmber,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    focusNode: state.focusNode,
                    cursorColor: MyColor.white,
                    style: MyTextStyle.white,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _closeButton(
                          visible: clearButtonVisible.value,
                          onPressed: () => textEditingController.clear(),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(),
                    ),
                    onSubmitted: (text) {
                      textEditingController.clear();
                      controller.add(text: text);
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: 1 < options.length
                    ? () {
                        final option = controller.decision();
                        showDialog(
                          context: context,
                          builder: (context) => _dialog(option: option),
                          barrierDismissible: false,
                        );
                      }
                    : null,
                child: const Text('決断'),
              ),
            ]),
          ),
        ),
      );
    });
  }

  Widget _dialog({required String option}) {
    return HookConsumer(builder: (context, ref, child) {
      final controller = ref.read(homePageProvider.notifier);

      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SingleChildScrollView(child: _option(option: option)),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.hide();
                },
                child: const Text(
                  'やめる',
                  style: TextStyle(color: MyColor.amber),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.show();
                },
                child: const Text(
                  'やり直す',
                  style: TextStyle(color: MyColor.amber),
                ),
              ),
            ]),
          ]),
        ),
      );
    });
  }

  Widget _closeButton({bool? visible, VoidCallback? onPressed}) {
    return Visibility(
      visible: visible ?? true,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.close),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
