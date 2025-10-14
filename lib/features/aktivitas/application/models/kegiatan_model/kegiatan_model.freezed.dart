// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kegiatan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KegiatanModel {
  String get id;
  String get nama;
  String get poin;

  /// Create a copy of KegiatanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KegiatanModelCopyWith<KegiatanModel> get copyWith =>
      _$KegiatanModelCopyWithImpl<KegiatanModel>(
          this as KegiatanModel, _$identity);

  /// Serializes this KegiatanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KegiatanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.poin, poin) || other.poin == poin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, poin);

  @override
  String toString() {
    return 'KegiatanModel(id: $id, nama: $nama, poin: $poin)';
  }
}

/// @nodoc
abstract mixin class $KegiatanModelCopyWith<$Res> {
  factory $KegiatanModelCopyWith(
          KegiatanModel value, $Res Function(KegiatanModel) _then) =
      _$KegiatanModelCopyWithImpl;
  @useResult
  $Res call({String id, String nama, String poin});
}

/// @nodoc
class _$KegiatanModelCopyWithImpl<$Res>
    implements $KegiatanModelCopyWith<$Res> {
  _$KegiatanModelCopyWithImpl(this._self, this._then);

  final KegiatanModel _self;
  final $Res Function(KegiatanModel) _then;

  /// Create a copy of KegiatanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? poin = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      poin: null == poin
          ? _self.poin
          : poin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _KegiatanModel implements KegiatanModel {
  _KegiatanModel({required this.id, required this.nama, required this.poin});
  factory _KegiatanModel.fromJson(Map<String, dynamic> json) =>
      _$KegiatanModelFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String poin;

  /// Create a copy of KegiatanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KegiatanModelCopyWith<_KegiatanModel> get copyWith =>
      __$KegiatanModelCopyWithImpl<_KegiatanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KegiatanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KegiatanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.poin, poin) || other.poin == poin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, poin);

  @override
  String toString() {
    return 'KegiatanModel(id: $id, nama: $nama, poin: $poin)';
  }
}

/// @nodoc
abstract mixin class _$KegiatanModelCopyWith<$Res>
    implements $KegiatanModelCopyWith<$Res> {
  factory _$KegiatanModelCopyWith(
          _KegiatanModel value, $Res Function(_KegiatanModel) _then) =
      __$KegiatanModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String nama, String poin});
}

/// @nodoc
class __$KegiatanModelCopyWithImpl<$Res>
    implements _$KegiatanModelCopyWith<$Res> {
  __$KegiatanModelCopyWithImpl(this._self, this._then);

  final _KegiatanModel _self;
  final $Res Function(_KegiatanModel) _then;

  /// Create a copy of KegiatanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? poin = null,
  }) {
    return _then(_KegiatanModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      poin: null == poin
          ? _self.poin
          : poin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
