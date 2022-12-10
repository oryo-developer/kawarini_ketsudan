import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kawarini_ketsudan/model/decision_model.dart';
import 'package:kawarini_ketsudan/service/decision_service.dart';

final decisionsProvider =
    StateNotifierProvider<DecisionsController, List<Decision>>(
  (ref) {
    final decisionService = ref.watch(decisionServiceProvider);
    return DecisionsController(decisionService: decisionService);
  },
);

class DecisionsController extends StateNotifier<List<Decision>> {
  DecisionsController({required this.decisionService}) : super([]) {
    Future(() async => state = await findAll());
    decisionService.stream.listen((decisions) => state = decisions);
  }

  final DecisionService decisionService;

  void put({required List<String> options, required String option}) {
    final decision = Decision()
      ..options = options
      ..option = option;
    decisionService.put(decision: decision);
  }

  Future<List<Decision>> findAll() => decisionService.findAll();

  void delete({required Decision decision}) {
    final id = decision.id;
    decisionService.delete(id: id);
  }
}
