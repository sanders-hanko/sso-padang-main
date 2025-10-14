// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tujuan_surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TujuanSuratModel {
  String get id;
  String get penerimaId;
  String get penerimaNama;

  /// Create a copy of TujuanSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TujuanSuratModelCopyWith<TujuanSuratModel> get copyWith =>
      _$TujuanSuratModelCopyWithImpl<TujuanSuratModel>(
          this as TujuanSuratModel, _$identity);

  /// Serializes this TujuanSuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TujuanSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.penerimaId, penerimaId) ||
                other.penerimaId == penerimaId) &&
            (identical(other.penerimaNama, penerimaNama) ||
                other.penerimaNama == penerimaNama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, penerimaId, penerimaNama);

  @override
  String toString() {
    return 'TujuanSuratModel(id: $id, penerimaId: $penerimaId, penerimaNama: $penerimaNama)';
  }
}

/// @nodoc
abstract mixin class $TujuanSuratModelCopyWith<$Res> {
  factory $TujuanSuratModelCopyWith(
          TujuanSuratModel value, $Res Function(TujuanSuratModel) _then) =
      _$TujuanSuratModelCopyWithImpl;
  @useResult
  $Res call({String id, String penerimaId, String penerimaNama});
}

/// @nodoc
class _$TujuanSuratModelCopyWithImpl<$Res>
    implements $TujuanSuratModelCopyWith<$Res> {
  _$TujuanSuratModelCopyWithImpl(this._self, this._then);

  final TujuanSuratModel _self;
  final $Res Function(TujuanSuratModel) _then;

  /// Create a copy of TujuanSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? penerimaId = null,
    Object? penerimaNama = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      penerimaId: null == penerimaId
          ? _self.penerimaId
          : penerimaId // ignore: cast_nullable_to_non_nullable
              as String,
      penerimaNama: null == penerimaNama
          ? _self.penerimaNama
          : penerimaNama // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TujuanSuratModel implements TujuanSuratModel {
  _TujuanSuratModel(
      {required this.id, required this.penerimaId, required this.penerimaNama});
  factory _TujuanSuratModel.fromJson(Map<String, dynamic> json) =>
      _$TujuanSuratModelFromJson(json);

  @override
  final String id;
  @override
  final String penerimaId;
  @override
  final String penerimaNama;

  /// Create a copy of TujuanSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TujuanSuratModelCopyWith<_TujuanSuratModel> get copyWith =>
      __$TujuanSuratModelCopyWithImpl<_TujuanSuratModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TujuanSuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TujuanSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.penerimaId, penerimaId) ||
                other.penerimaId == penerimaId) &&
            (identical(other.penerimaNama, penerimaNama) ||
                other.penerimaNama == penerimaNama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, penerimaId, penerimaNama);

  @override
  String toString() {
    return 'TujuanSuratModel(id: $id, penerimaId: $penerimaId, penerimaNama: $penerimaNama)';
  }
}

/// @nodoc
abstract mixin class _$TujuanSuratModelCopyWith<$Res>
    implements $TujuanSuratModelCopyWith<$Res> {
  factory _$TujuanSuratModelCopyWith(
          _TujuanSuratModel value, $Res Function(_TujuanSuratModel) _then) =
      __$TujuanSuratModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String penerimaId, String penerimaNama});
}

/// @nodoc
class __$TujuanSuratModelCopyWithImpl<$Res>
    implements _$TujuanSuratModelCopyWith<$Res> {
  __$TujuanSuratModelCopyWithImpl(this._self, this._then);

  final _TujuanSuratModel _self;
  final $Res Function(_TujuanSuratModel) _then;

  /// Create a copy of TujuanSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? penerimaId = null,
    Object? penerimaNama = null,
  }) {
    return _then(_TujuanSuratModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      penerimaId: null == penerimaId
          ? _self.penerimaId
          : penerimaId // ignore: cast_nullable_to_non_nullable
              as String,
      penerimaNama: null == penerimaNama
          ? _self.penerimaNama
          : penerimaNama // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
