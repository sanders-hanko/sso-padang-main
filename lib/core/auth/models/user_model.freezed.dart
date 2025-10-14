// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String get nip;
  String get nama;
  String get jabatanId;
  String get jabatanNama;
  String get unorIndukId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatanId, jabatanId) ||
                other.jabatanId == jabatanId) &&
            (identical(other.jabatanNama, jabatanNama) ||
                other.jabatanNama == jabatanNama) &&
            (identical(other.unorIndukId, unorIndukId) ||
                other.unorIndukId == unorIndukId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nip, nama, jabatanId, jabatanNama, unorIndukId);

  @override
  String toString() {
    return 'UserModel(nip: $nip, nama: $nama, jabatanId: $jabatanId, jabatanNama: $jabatanNama, unorIndukId: $unorIndukId)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String nip,
      String nama,
      String jabatanId,
      String jabatanNama,
      String unorIndukId});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatanId = null,
    Object? jabatanNama = null,
    Object? unorIndukId = null,
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
      jabatanId: null == jabatanId
          ? _self.jabatanId
          : jabatanId // ignore: cast_nullable_to_non_nullable
              as String,
      jabatanNama: null == jabatanNama
          ? _self.jabatanNama
          : jabatanNama // ignore: cast_nullable_to_non_nullable
              as String,
      unorIndukId: null == unorIndukId
          ? _self.unorIndukId
          : unorIndukId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  _UserModel(
      {required this.nip,
      required this.nama,
      required this.jabatanId,
      required this.jabatanNama,
      required this.unorIndukId});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String nip;
  @override
  final String nama;
  @override
  final String jabatanId;
  @override
  final String jabatanNama;
  @override
  final String unorIndukId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatanId, jabatanId) ||
                other.jabatanId == jabatanId) &&
            (identical(other.jabatanNama, jabatanNama) ||
                other.jabatanNama == jabatanNama) &&
            (identical(other.unorIndukId, unorIndukId) ||
                other.unorIndukId == unorIndukId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nip, nama, jabatanId, jabatanNama, unorIndukId);

  @override
  String toString() {
    return 'UserModel(nip: $nip, nama: $nama, jabatanId: $jabatanId, jabatanNama: $jabatanNama, unorIndukId: $unorIndukId)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String nip,
      String nama,
      String jabatanId,
      String jabatanNama,
      String unorIndukId});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatanId = null,
    Object? jabatanNama = null,
    Object? unorIndukId = null,
  }) {
    return _then(_UserModel(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      jabatanId: null == jabatanId
          ? _self.jabatanId
          : jabatanId // ignore: cast_nullable_to_non_nullable
              as String,
      jabatanNama: null == jabatanNama
          ? _self.jabatanNama
          : jabatanNama // ignore: cast_nullable_to_non_nullable
              as String,
      unorIndukId: null == unorIndukId
          ? _self.unorIndukId
          : unorIndukId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
