import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:kawarini_ketsudan/model/decision_model.dart';
import 'package:path_provider/path_provider.dart';

final isarProvider = FutureProvider((ref) async {
  final directory = await getApplicationSupportDirectory();
  return Isar.open([DecisionSchema], directory: directory.path);
});

final decisionServiceProvider = Provider((ref) => DecisionService(ref: ref));

class DecisionService {
  DecisionService({required this.ref}) {
    Future(() async {
      final isar = await ref.watch(isarProvider.future);
      isar.decisions.watchLazy().listen((_) async {
        streamController.sink.add(await findAll());
      });
    });
  }

  final Ref ref;

  final streamController = StreamController<List<Decision>>();

  Stream<List<Decision>> get stream => streamController.stream;

  void put({required Decision decision}) async {
    final isar = await ref.watch(isarProvider.future);
    isar.writeTxn(() async {
      isar.decisions.put(decision);
    });
  }

  Future<List<Decision>> findAll() async {
    final isar = await ref.watch(isarProvider.future);
    return isar.decisions.where().sortByCreatedAtDesc().findAll();
  }

  void delete({required Id id}) async {
    final isar = await ref.watch(isarProvider.future);
    isar.writeTxn(() async {
      isar.decisions.delete(id);
    });
  }
}
