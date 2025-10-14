// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asisten_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsistenModel {
  String get nip;
  String get nama;
  String get jabatan;

  /// Create a copy of AsistenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsistenModelCopyWith<AsistenModel> get copyWith =>
      _$AsistenModelCopyWithImpl<AsistenModel>(
          this as AsistenModel, _$identity);

  /// Serializes this AsistenModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsistenModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, nama, jabatan);

  @override
  String toString() {
    return 'AsistenModel(nip: $nip, nama: $nama, jabatan: $jabatan)';
  }
}

/// @nodoc
abstract mixin class $AsistenModelCopyWith<$Res> {
  factory $AsistenModelCopyWith(
          AsistenModel value, $Res Function(AsistenModel) _then) =
      _$AsistenModelCopyWithImpl;
  @useResult
  $Res call({String nip, String nama, String jabatan});
}

/// @nodoc
class _$AsistenModelCopyWithImpl<$Res> implements $AsistenModelCopyWith<$Res> {
  _$AsistenModelCopyWithImpl(this._self, this._then);

  final AsistenModel _self;
  final $Res Function(AsistenModel) _then;

  /// Create a copy of AsistenModel
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
class _AsistenModel implements AsistenModel {
  _AsistenModel({required this.nip, required this.nama, required this.jabatan});
  factory _AsistenModel.fromJson(Map<String, dynamic> json) =>
      _$AsistenModelFromJson(json);

  @override
  final String nip;
  @override
  final String nama;
  @override
  final String jabatan;

  /// Create a copy of AsistenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsistenModelCopyWith<_AsistenModel> get copyWith =>
      __$AsistenModelCopyWithImpl<_AsistenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AsistenModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsistenModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, nama, jabatan);

  @override
  String toString() {
    return 'AsistenModel(nip: $nip, nama: $nama, jabatan: $jabatan)';
  }
}

/// @nodoc
abstract mixin class _$AsistenModelCopyWith<$Res>
    implements $AsistenModelCopyWith<$Res> {
  factory _$AsistenModelCopyWith(
          _AsistenModel value, $Res Function(_AsistenModel) _then) =
      __$AsistenModelCopyWithImpl;
  @override
  @useResult
  $Res call({String nip, String nama, String jabatan});
}

/// @nodoc
class __$AsistenModelCopyWithImpl<$Res>
    implements _$AsistenModelCopyWith<$Res> {
  __$AsistenModelCopyWithImpl(this._self, this._then);

  final _AsistenModel _self;
  final $Res Function(_AsistenModel) _then;

  /// Create a copy of AsistenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
  }) {
    return _then(_AsistenModel(
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
