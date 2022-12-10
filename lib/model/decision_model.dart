import 'package:isar/isar.dart';

part 'decision_model.g.dart';

@collection
class Decision {
  Id id = Isar.autoIncrement;
  late List<String> options;
  late String option;
  DateTime createdAt = DateTime.now();
}
