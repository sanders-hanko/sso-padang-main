// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organisasi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganisasiModel {
  String get id;
  String get namaOrganisasi;
  String get type;

  /// Create a copy of OrganisasiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganisasiModelCopyWith<OrganisasiModel> get copyWith =>
      _$OrganisasiModelCopyWithImpl<OrganisasiModel>(
          this as OrganisasiModel, _$identity);

  /// Serializes this OrganisasiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganisasiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaOrganisasi, namaOrganisasi) ||
                other.namaOrganisasi == namaOrganisasi) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaOrganisasi, type);

  @override
  String toString() {
    return 'OrganisasiModel(id: $id, namaOrganisasi: $namaOrganisasi, type: $type)';
  }
}

/// @nodoc
abstract mixin class $OrganisasiModelCopyWith<$Res> {
  factory $OrganisasiModelCopyWith(
          OrganisasiModel value, $Res Function(OrganisasiModel) _then) =
      _$OrganisasiModelCopyWithImpl;
  @useResult
  $Res call({String id, String namaOrganisasi, String type});
}

/// @nodoc
class _$OrganisasiModelCopyWithImpl<$Res>
    implements $OrganisasiModelCopyWith<$Res> {
  _$OrganisasiModelCopyWithImpl(this._self, this._then);

  final OrganisasiModel _self;
  final $Res Function(OrganisasiModel) _then;

  /// Create a copy of OrganisasiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaOrganisasi = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namaOrganisasi: null == namaOrganisasi
          ? _self.namaOrganisasi
          : namaOrganisasi // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OrganisasiModel implements OrganisasiModel {
  _OrganisasiModel(
      {required this.id, required this.namaOrganisasi, required this.type});
  factory _OrganisasiModel.fromJson(Map<String, dynamic> json) =>
      _$OrganisasiModelFromJson(json);

  @override
  final String id;
  @override
  final String namaOrganisasi;
  @override
  final String type;

  /// Create a copy of OrganisasiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganisasiModelCopyWith<_OrganisasiModel> get copyWith =>
      __$OrganisasiModelCopyWithImpl<_OrganisasiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrganisasiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganisasiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaOrganisasi, namaOrganisasi) ||
                other.namaOrganisasi == namaOrganisasi) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaOrganisasi, type);

  @override
  String toString() {
    return 'OrganisasiModel(id: $id, namaOrganisasi: $namaOrganisasi, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$OrganisasiModelCopyWith<$Res>
    implements $OrganisasiModelCopyWith<$Res> {
  factory _$OrganisasiModelCopyWith(
          _OrganisasiModel value, $Res Function(_OrganisasiModel) _then) =
      __$OrganisasiModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String namaOrganisasi, String type});
}

/// @nodoc
class __$OrganisasiModelCopyWithImpl<$Res>
    implements _$OrganisasiModelCopyWith<$Res> {
  __$OrganisasiModelCopyWithImpl(this._self, this._then);

  final _OrganisasiModel _self;
  final $Res Function(_OrganisasiModel) _then;

  /// Create a copy of OrganisasiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? namaOrganisasi = null,
    Object? type = null,
  }) {
    return _then(_OrganisasiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namaOrganisasi: null == namaOrganisasi
          ? _self.namaOrganisasi
          : namaOrganisasi // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
