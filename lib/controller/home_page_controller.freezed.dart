// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  bool get optionsVisible => throw _privateConstructorUsedError;
  bool get bottomSheetVisible => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  FocusNode get focusNode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {bool optionsVisible,
      bool bottomSheetVisible,
      ScrollController scrollController,
      FocusNode focusNode});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionsVisible = null,
    Object? bottomSheetVisible = null,
    Object? scrollController = null,
    Object? focusNode = null,
  }) {
    return _then(_value.copyWith(
      optionsVisible: null == optionsVisible
          ? _value.optionsVisible
          : optionsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomSheetVisible: null == bottomSheetVisible
          ? _value.bottomSheetVisible
          : bottomSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      focusNode: null == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool optionsVisible,
      bool bottomSheetVisible,
      ScrollController scrollController,
      FocusNode focusNode});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionsVisible = null,
    Object? bottomSheetVisible = null,
    Object? scrollController = null,
    Object? focusNode = null,
  }) {
    return _then(_$_HomePageState(
      optionsVisible: null == optionsVisible
          ? _value.optionsVisible
          : optionsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomSheetVisible: null == bottomSheetVisible
          ? _value.bottomSheetVisible
          : bottomSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      focusNode: null == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  const _$_HomePageState(
      {this.optionsVisible = false,
      this.bottomSheetVisible = false,
      required this.scrollController,
      required this.focusNode});

  @override
  @JsonKey()
  final bool optionsVisible;
  @override
  @JsonKey()
  final bool bottomSheetVisible;
  @override
  final ScrollController scrollController;
  @override
  final FocusNode focusNode;

  @override
  String toString() {
    return 'HomePageState(optionsVisible: $optionsVisible, bottomSheetVisible: $bottomSheetVisible, scrollController: $scrollController, focusNode: $focusNode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            (identical(other.optionsVisible, optionsVisible) ||
                other.optionsVisible == optionsVisible) &&
            (identical(other.bottomSheetVisible, bottomSheetVisible) ||
                other.bottomSheetVisible == bottomSheetVisible) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, optionsVisible,
      bottomSheetVisible, scrollController, focusNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final bool optionsVisible,
      final bool bottomSheetVisible,
      required final ScrollController scrollController,
      required final FocusNode focusNode}) = _$_HomePageState;

  @override
  bool get optionsVisible;
  @override
  bool get bottomSheetVisible;
  @override
  ScrollController get scrollController;
  @override
  FocusNode get focusNode;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
