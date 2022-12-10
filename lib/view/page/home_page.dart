import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kawarini_ketsudan/controller/home_page_controller.dart';
import 'package:kawarini_ketsudan/extension/text_editing_controller_extension.dart';
import 'package:kawarini_ketsudan/model/option_model.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';
import 'package:kawarini_ketsudan/view/theme/my_text_style.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
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
                  child: state.optionsVisible ? _options() : _decisionHistory(),
                ),
              ),
              Visibility(
                visible: !state.optionsVisible,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.trueTrueFocus(options: []),
                    child: const Text('決断'),
                  ),
                ),
              ),
            ]),
          ),
          bottomSheet: _bottomSheet(),
        ),
      );
    });
  }

  Widget _decisionHistory() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text('〜　今までの決断(10)　〜', style: MyTextStyle.black),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColor.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Row(children: [
                  Expanded(child: Text('aiueo', style: MyTextStyle.white20)),
                  _closeButton(onPressed: () {}),
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
                    animationDuration: const Duration(seconds: 10),
                    backDuration: const Duration(seconds: 10),
                    forwardAnimation: Curves.easeInOut,
                    backwardAnimation: Curves.easeInOut,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Option(id: const Uuid().v4(), text: '付き合う'),
                          Option(id: const Uuid().v4(), text: '付き合わない'),
                          Option(id: const Uuid().v4(), text: '来年まで眠る'),
                          Option(id: const Uuid().v4(), text: '再来年まで勉強する'),
                          Option(id: const Uuid().v4(), text: '外を大晦日まで走ってくる'),
                          Option(
                              id: const Uuid().v4(),
                              text: "I'm oryo developer."),
                          Option(id: const Uuid().v4(), text: 'aiueoddd'),
                          Option(id: const Uuid().v4(), text: 'あいうえおあいうえお'),
                          Option(id: const Uuid().v4(), text: 'aiueo'),
                          Option(
                              id: const Uuid().v4(),
                              text: 'あいうえおいうえおあうえおあいえおあいうおあいうえ'),
                        ].map((option) => _option(option: option)).toList(),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _options() {
    return HookConsumer(builder: (context, ref, child) {
      final state = ref.watch(homePageProvider);
      final controller = ref.read(homePageProvider.notifier);

      return Center(
        child: SingleChildScrollView(
          controller: state.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: state.options.map((option) {
                return _option(
                  option: option,
                  onPressed: () => controller.remove(option: option),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  Widget _option({required Option option, VoidCallback? onPressed}) {
    return Container(
      margin: EdgeInsets.only(right: onPressed == null ? 8 : 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColor.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: onPressed == null ? 100 : double.infinity,
            ),
            child: Text(
              option.text,
              style: onPressed == null
                  ? MyTextStyle.white10
                  : MyTextStyle.whiteOverflow,
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
                  controller.falseFalseUnfocus();
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
                onPressed: 1 < state.options.length
                    ? () {
                        debugPrint('決断');
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
