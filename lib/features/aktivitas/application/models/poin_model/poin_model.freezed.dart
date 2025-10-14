// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PoinModel {
  String get diajukan;
  String get diterima;
  String get ditolak;

  /// Create a copy of PoinModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PoinModelCopyWith<PoinModel> get copyWith =>
      _$PoinModelCopyWithImpl<PoinModel>(this as PoinModel, _$identity);

  /// Serializes this PoinModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PoinModel &&
            (identical(other.diajukan, diajukan) ||
                other.diajukan == diajukan) &&
            (identical(other.diterima, diterima) ||
                other.diterima == diterima) &&
            (identical(other.ditolak, ditolak) || other.ditolak == ditolak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diajukan, diterima, ditolak);

  @override
  String toString() {
    return 'PoinModel(diajukan: $diajukan, diterima: $diterima, ditolak: $ditolak)';
  }
}

/// @nodoc
abstract mixin class $PoinModelCopyWith<$Res> {
  factory $PoinModelCopyWith(PoinModel value, $Res Function(PoinModel) _then) =
      _$PoinModelCopyWithImpl;
  @useResult
  $Res call({String diajukan, String diterima, String ditolak});
}

/// @nodoc
class _$PoinModelCopyWithImpl<$Res> implements $PoinModelCopyWith<$Res> {
  _$PoinModelCopyWithImpl(this._self, this._then);

  final PoinModel _self;
  final $Res Function(PoinModel) _then;

  /// Create a copy of PoinModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diajukan = null,
    Object? diterima = null,
    Object? ditolak = null,
  }) {
    return _then(_self.copyWith(
      diajukan: null == diajukan
          ? _self.diajukan
          : diajukan // ignore: cast_nullable_to_non_nullable
              as String,
      diterima: null == diterima
          ? _self.diterima
          : diterima // ignore: cast_nullable_to_non_nullable
              as String,
      ditolak: null == ditolak
          ? _self.ditolak
          : ditolak // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PoinModel implements PoinModel {
  _PoinModel(
      {required this.diajukan, required this.diterima, required this.ditolak});
  factory _PoinModel.fromJson(Map<String, dynamic> json) =>
      _$PoinModelFromJson(json);

  @override
  final String diajukan;
  @override
  final String diterima;
  @override
  final String ditolak;

  /// Create a copy of PoinModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PoinModelCopyWith<_PoinModel> get copyWith =>
      __$PoinModelCopyWithImpl<_PoinModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PoinModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PoinModel &&
            (identical(other.diajukan, diajukan) ||
                other.diajukan == diajukan) &&
            (identical(other.diterima, diterima) ||
                other.diterima == diterima) &&
            (identical(other.ditolak, ditolak) || other.ditolak == ditolak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diajukan, diterima, ditolak);

  @override
  String toString() {
    return 'PoinModel(diajukan: $diajukan, diterima: $diterima, ditolak: $ditolak)';
  }
}

/// @nodoc
abstract mixin class _$PoinModelCopyWith<$Res>
    implements $PoinModelCopyWith<$Res> {
  factory _$PoinModelCopyWith(
          _PoinModel value, $Res Function(_PoinModel) _then) =
      __$PoinModelCopyWithImpl;
  @override
  @useResult
  $Res call({String diajukan, String diterima, String ditolak});
}

/// @nodoc
class __$PoinModelCopyWithImpl<$Res> implements _$PoinModelCopyWith<$Res> {
  __$PoinModelCopyWithImpl(this._self, this._then);

  final _PoinModel _self;
  final $Res Function(_PoinModel) _then;

  /// Create a copy of PoinModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diajukan = null,
    Object? diterima = null,
    Object? ditolak = null,
  }) {
    return _then(_PoinModel(
      diajukan: null == diajukan
          ? _self.diajukan
          : diajukan // ignore: cast_nullable_to_non_nullable
              as String,
      diterima: null == diterima
          ? _self.diterima
          : diterima // ignore: cast_nullable_to_non_nullable
              as String,
      ditolak: null == ditolak
          ? _self.ditolak
          : ditolak // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
