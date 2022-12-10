import 'package:hooks_riverpod/hooks_riverpod.dart';

final optionsProvider = StateNotifierProvider<OptionsController, List<String>>(
  (ref) {
    return OptionsController();
  },
);

class OptionsController extends StateNotifier<List<String>> {
  OptionsController() : super([]);

  void initialize({required List<String> options}) => state = options;

  bool add({required String text}) {
    final trimText = text.trim();
    if (trimText.isNotEmpty) {
      state = [...state, trimText];
      return true;
    }
    return false;
  }

  void remove({required int index}) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (index != i) state[i]
    ];
  }

  void removeAll() => state = [];

  String get random => (state.toList()..shuffle()).first;
}
