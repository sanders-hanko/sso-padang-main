// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atasan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AtasanModel {
  String get nip;
  String get nama;
  String get jabatan;

  /// Create a copy of AtasanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AtasanModelCopyWith<AtasanModel> get copyWith =>
      _$AtasanModelCopyWithImpl<AtasanModel>(this as AtasanModel, _$identity);

  /// Serializes this AtasanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AtasanModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, nama, jabatan);

  @override
  String toString() {
    return 'AtasanModel(nip: $nip, nama: $nama, jabatan: $jabatan)';
  }
}

/// @nodoc
abstract mixin class $AtasanModelCopyWith<$Res> {
  factory $AtasanModelCopyWith(
          AtasanModel value, $Res Function(AtasanModel) _then) =
      _$AtasanModelCopyWithImpl;
  @useResult
  $Res call({String nip, String nama, String jabatan});
}

/// @nodoc
class _$AtasanModelCopyWithImpl<$Res> implements $AtasanModelCopyWith<$Res> {
  _$AtasanModelCopyWithImpl(this._self, this._then);

  final AtasanModel _self;
  final $Res Function(AtasanModel) _then;

  /// Create a copy of AtasanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
  }) {
    return _then(_self.copyWith(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      jabatan: null == jabatan
          ? _self.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AtasanModel implements AtasanModel {
  _AtasanModel({required this.nip, required this.nama, required this.jabatan});
  factory _AtasanModel.fromJson(Map<String, dynamic> json) =>
      _$AtasanModelFromJson(json);

  @override
  final String nip;
  @override
  final String nama;
  @override
  final String jabatan;

  /// Create a copy of AtasanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AtasanModelCopyWith<_AtasanModel> get copyWith =>
      __$AtasanModelCopyWithImpl<_AtasanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AtasanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AtasanModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, nama, jabatan);

  @override
  String toString() {
    return 'AtasanModel(nip: $nip, nama: $nama, jabatan: $jabatan)';
  }
}

/// @nodoc
abstract mixin class _$AtasanModelCopyWith<$Res>
    implements $AtasanModelCopyWith<$Res> {
  factory _$AtasanModelCopyWith(
          _AtasanModel value, $Res Function(_AtasanModel) _then) =
      __$AtasanModelCopyWithImpl;
  @override
  @useResult
  $Res call({String nip, String nama, String jabatan});
}

/// @nodoc
class __$AtasanModelCopyWithImpl<$Res> implements _$AtasanModelCopyWith<$Res> {
  __$AtasanModelCopyWithImpl(this._self, this._then);

  final _AtasanModel _self;
  final $Res Function(_AtasanModel) _then;

  /// Create a copy of AtasanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
  }) {
    return _then(_AtasanModel(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      jabatan: null == jabatan
          ? _self.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
