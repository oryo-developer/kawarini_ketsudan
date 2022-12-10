import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kawarini_ketsudan/controller/decisions_controller.dart';
import 'package:kawarini_ketsudan/controller/options_controller.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(false) bool optionsVisible,
    @Default(false) bool bottomSheetVisible,
    required ScrollController scrollController,
    required FocusNode focusNode,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider<HomePageController, HomePageState>(
  (ref) {
    return HomePageController(ref: ref);
  },
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController({required this.ref})
      : super(HomePageState(
            scrollController: ScrollController(), focusNode: FocusNode()));

  final Ref ref;

  String decision() {
    state = state.copyWith(bottomSheetVisible: false);
    final options = ref.read(optionsProvider);
    final option = ref.read(optionsProvider.notifier).random;
    ref.read(decisionsProvider.notifier).put(options: options, option: option);
    return option;
  }

  void show({List<String>? options}) {
    if (options != null) {
      ref.read(optionsProvider.notifier).initialize(options: options);
    }
    state.focusNode.requestFocus();
    state = state.copyWith(
      optionsVisible: true,
      bottomSheetVisible: true,
    );
  }

  void hide() {
    state.focusNode.unfocus();
    ref.read(optionsProvider.notifier).removeAll();
    state = state.copyWith(
      optionsVisible: false,
      bottomSheetVisible: false,
    );
  }

  void add({required String text}) {
    state.focusNode.requestFocus();
    final success = ref.read(optionsProvider.notifier).add(text: text);
    if (success) {
      Future.delayed(const Duration(milliseconds: 20)).then((_) {
        state.scrollController.animateTo(
          state.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
        );
      });
    }
  }
}
