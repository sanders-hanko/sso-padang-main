// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aktivitas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AktivitasModel {
  String get nip;
  String get atasan;
  String get tanggal;
  String get coreValue;
  String get kegiatan;
  String get foto;
  String get filename;
  String get keterangan;

  /// Create a copy of AktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AktivitasModelCopyWith<AktivitasModel> get copyWith =>
      _$AktivitasModelCopyWithImpl<AktivitasModel>(
          this as AktivitasModel, _$identity);

  /// Serializes this AktivitasModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AktivitasModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.atasan, atasan) || other.atasan == atasan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, atasan, tanggal, coreValue,
      kegiatan, foto, filename, keterangan);

  @override
  String toString() {
    return 'AktivitasModel(nip: $nip, atasan: $atasan, tanggal: $tanggal, coreValue: $coreValue, kegiatan: $kegiatan, foto: $foto, filename: $filename, keterangan: $keterangan)';
  }
}

/// @nodoc
abstract mixin class $AktivitasModelCopyWith<$Res> {
  factory $AktivitasModelCopyWith(
          AktivitasModel value, $Res Function(AktivitasModel) _then) =
      _$AktivitasModelCopyWithImpl;
  @useResult
  $Res call(
      {String nip,
      String atasan,
      String tanggal,
      String coreValue,
      String kegiatan,
      String foto,
      String filename,
      String keterangan});
}

/// @nodoc
class _$AktivitasModelCopyWithImpl<$Res>
    implements $AktivitasModelCopyWith<$Res> {
  _$AktivitasModelCopyWithImpl(this._self, this._then);

  final AktivitasModel _self;
  final $Res Function(AktivitasModel) _then;

  /// Create a copy of AktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? atasan = null,
    Object? tanggal = null,
    Object? coreValue = null,
    Object? kegiatan = null,
    Object? foto = null,
    Object? filename = null,
    Object? keterangan = null,
  }) {
    return _then(_self.copyWith(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      atasan: null == atasan
          ? _self.atasan
          : atasan // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      coreValue: null == coreValue
          ? _self.coreValue
          : coreValue // ignore: cast_nullable_to_non_nullable
              as String,
      kegiatan: null == kegiatan
          ? _self.kegiatan
          : kegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      foto: null == foto
          ? _self.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AktivitasModel implements AktivitasModel {
  _AktivitasModel(
      {required this.nip,
      required this.atasan,
      required this.tanggal,
      required this.coreValue,
      required this.kegiatan,
      required this.foto,
      required this.filename,
      required this.keterangan});
  factory _AktivitasModel.fromJson(Map<String, dynamic> json) =>
      _$AktivitasModelFromJson(json);

  @override
  final String nip;
  @override
  final String atasan;
  @override
  final String tanggal;
  @override
  final String coreValue;
  @override
  final String kegiatan;
  @override
  final String foto;
  @override
  final String filename;
  @override
  final String keterangan;

  /// Create a copy of AktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AktivitasModelCopyWith<_AktivitasModel> get copyWith =>
      __$AktivitasModelCopyWithImpl<_AktivitasModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AktivitasModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AktivitasModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.atasan, atasan) || other.atasan == atasan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nip, atasan, tanggal, coreValue,
      kegiatan, foto, filename, keterangan);

  @override
  String toString() {
    return 'AktivitasModel(nip: $nip, atasan: $atasan, tanggal: $tanggal, coreValue: $coreValue, kegiatan: $kegiatan, foto: $foto, filename: $filename, keterangan: $keterangan)';
  }
}

/// @nodoc
abstract mixin class _$AktivitasModelCopyWith<$Res>
    implements $AktivitasModelCopyWith<$Res> {
  factory _$AktivitasModelCopyWith(
          _AktivitasModel value, $Res Function(_AktivitasModel) _then) =
      __$AktivitasModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String nip,
      String atasan,
      String tanggal,
      String coreValue,
      String kegiatan,
      String foto,
      String filename,
      String keterangan});
}

/// @nodoc
class __$AktivitasModelCopyWithImpl<$Res>
    implements _$AktivitasModelCopyWith<$Res> {
  __$AktivitasModelCopyWithImpl(this._self, this._then);

  final _AktivitasModel _self;
  final $Res Function(_AktivitasModel) _then;

  /// Create a copy of AktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? atasan = null,
    Object? tanggal = null,
    Object? coreValue = null,
    Object? kegiatan = null,
    Object? foto = null,
    Object? filename = null,
    Object? keterangan = null,
  }) {
    return _then(_AktivitasModel(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      atasan: null == atasan
          ? _self.atasan
          : atasan // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      coreValue: null == coreValue
          ? _self.coreValue
          : coreValue // ignore: cast_nullable_to_non_nullable
              as String,
      kegiatan: null == kegiatan
          ? _self.kegiatan
          : kegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      foto: null == foto
          ? _self.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
