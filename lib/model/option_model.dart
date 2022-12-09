import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_model.freezed.dart';

@freezed
class Option with _$Option {
  const factory Option({
    required String id,
    required String text,
  }) = _Option;
}
