import 'package:isar/isar.dart';
import 'package:kawarini_ketsudan/model/option_model.dart';

part 'decision_model.g.dart';

@Collection()
class Decision {
  Id id = Isar.autoIncrement;
  @ignore
  late List<Option> options;
  @ignore
  late Option option;
  DateTime createdAt = DateTime.now();
} 