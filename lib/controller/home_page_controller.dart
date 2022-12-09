import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kawarini_ketsudan/model/option_model.dart';
import 'package:uuid/uuid.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Option> options,
    @Default(false) bool optionsVisible,
    @Default(false) bool bottomSheetVisible,
    required ScrollController scrollController,
    required FocusNode focusNode,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider<HomePageController, HomePageState>(
  (ref) {
    return HomePageController();
  },
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController()
      : super(HomePageState(
            scrollController: ScrollController(), focusNode: FocusNode()));

  void trueTrueFocus({required List<Option> options}) {
    state.focusNode.requestFocus();
    state = state.copyWith(
      options: options,
      optionsVisible: true,
      bottomSheetVisible: true,
    );
  }

  void falseFalseUnfocus() {
    state.focusNode.unfocus();
    state = state.copyWith(
      options: [],
      optionsVisible: false,
      bottomSheetVisible: false,
    );
  }

  void add({required String text}) {
    state.focusNode.requestFocus();
    final trimText = text.trim();
    if (trimText.isNotEmpty) {
      final option = Option(id: const Uuid().v4(), text: trimText);
      state = state.copyWith(options: [...state.options, option]);
      Future.delayed(const Duration(milliseconds: 15)).then((_) {
        state.scrollController.animateTo(
          state.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 185),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void remove({required Option option}) {
    final id = option.id;
    state = state.copyWith(
      options: [
        for (final o in state.options)
          if (o.id != id) o
      ],
    );
  }
}
