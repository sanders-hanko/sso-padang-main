// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_aktivitas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailAktivitasModel {
  String get id;
  String get nip;
  String get nama;
  String get jabatan;
  String get atasanNip;
  String get atasanNama;
  String get tanggal;
  String get coreValue;
  String get kegiatan;
  String get fotoUrl;
  String get keterangan;
  String get statusAktivitas;

  /// Create a copy of DetailAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailAktivitasModelCopyWith<DetailAktivitasModel> get copyWith =>
      _$DetailAktivitasModelCopyWithImpl<DetailAktivitasModel>(
          this as DetailAktivitasModel, _$identity);

  /// Serializes this DetailAktivitasModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailAktivitasModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.atasanNip, atasanNip) ||
                other.atasanNip == atasanNip) &&
            (identical(other.atasanNama, atasanNama) ||
                other.atasanNama == atasanNama) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.statusAktivitas, statusAktivitas) ||
                other.statusAktivitas == statusAktivitas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nip,
      nama,
      jabatan,
      atasanNip,
      atasanNama,
      tanggal,
      coreValue,
      kegiatan,
      fotoUrl,
      keterangan,
      statusAktivitas);

  @override
  String toString() {
    return 'DetailAktivitasModel(id: $id, nip: $nip, nama: $nama, jabatan: $jabatan, atasanNip: $atasanNip, atasanNama: $atasanNama, tanggal: $tanggal, coreValue: $coreValue, kegiatan: $kegiatan, fotoUrl: $fotoUrl, keterangan: $keterangan, statusAktivitas: $statusAktivitas)';
  }
}

/// @nodoc
abstract mixin class $DetailAktivitasModelCopyWith<$Res> {
  factory $DetailAktivitasModelCopyWith(DetailAktivitasModel value,
          $Res Function(DetailAktivitasModel) _then) =
      _$DetailAktivitasModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nip,
      String nama,
      String jabatan,
      String atasanNip,
      String atasanNama,
      String tanggal,
      String coreValue,
      String kegiatan,
      String fotoUrl,
      String keterangan,
      String statusAktivitas});
}

/// @nodoc
class _$DetailAktivitasModelCopyWithImpl<$Res>
    implements $DetailAktivitasModelCopyWith<$Res> {
  _$DetailAktivitasModelCopyWithImpl(this._self, this._then);

  final DetailAktivitasModel _self;
  final $Res Function(DetailAktivitasModel) _then;

  /// Create a copy of DetailAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? atasanNip = null,
    Object? atasanNama = null,
    Object? tanggal = null,
    Object? coreValue = null,
    Object? kegiatan = null,
    Object? fotoUrl = null,
    Object? keterangan = null,
    Object? statusAktivitas = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      atasanNip: null == atasanNip
          ? _self.atasanNip
          : atasanNip // ignore: cast_nullable_to_non_nullable
              as String,
      atasanNama: null == atasanNama
          ? _self.atasanNama
          : atasanNama // ignore: cast_nullable_to_non_nullable
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
      fotoUrl: null == fotoUrl
          ? _self.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      statusAktivitas: null == statusAktivitas
          ? _self.statusAktivitas
          : statusAktivitas // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DetailAktivitasModel implements DetailAktivitasModel {
  _DetailAktivitasModel(
      {required this.id,
      required this.nip,
      required this.nama,
      required this.jabatan,
      required this.atasanNip,
      required this.atasanNama,
      required this.tanggal,
      required this.coreValue,
      required this.kegiatan,
      required this.fotoUrl,
      required this.keterangan,
      required this.statusAktivitas});
  factory _DetailAktivitasModel.fromJson(Map<String, dynamic> json) =>
      _$DetailAktivitasModelFromJson(json);

  @override
  final String id;
  @override
  final String nip;
  @override
  final String nama;
  @override
  final String jabatan;
  @override
  final String atasanNip;
  @override
  final String atasanNama;
  @override
  final String tanggal;
  @override
  final String coreValue;
  @override
  final String kegiatan;
  @override
  final String fotoUrl;
  @override
  final String keterangan;
  @override
  final String statusAktivitas;

  /// Create a copy of DetailAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailAktivitasModelCopyWith<_DetailAktivitasModel> get copyWith =>
      __$DetailAktivitasModelCopyWithImpl<_DetailAktivitasModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetailAktivitasModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailAktivitasModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.atasanNip, atasanNip) ||
                other.atasanNip == atasanNip) &&
            (identical(other.atasanNama, atasanNama) ||
                other.atasanNama == atasanNama) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.statusAktivitas, statusAktivitas) ||
                other.statusAktivitas == statusAktivitas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nip,
      nama,
      jabatan,
      atasanNip,
      atasanNama,
      tanggal,
      coreValue,
      kegiatan,
      fotoUrl,
      keterangan,
      statusAktivitas);

  @override
  String toString() {
    return 'DetailAktivitasModel(id: $id, nip: $nip, nama: $nama, jabatan: $jabatan, atasanNip: $atasanNip, atasanNama: $atasanNama, tanggal: $tanggal, coreValue: $coreValue, kegiatan: $kegiatan, fotoUrl: $fotoUrl, keterangan: $keterangan, statusAktivitas: $statusAktivitas)';
  }
}

/// @nodoc
abstract mixin class _$DetailAktivitasModelCopyWith<$Res>
    implements $DetailAktivitasModelCopyWith<$Res> {
  factory _$DetailAktivitasModelCopyWith(_DetailAktivitasModel value,
          $Res Function(_DetailAktivitasModel) _then) =
      __$DetailAktivitasModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nip,
      String nama,
      String jabatan,
      String atasanNip,
      String atasanNama,
      String tanggal,
      String coreValue,
      String kegiatan,
      String fotoUrl,
      String keterangan,
      String statusAktivitas});
}

/// @nodoc
class __$DetailAktivitasModelCopyWithImpl<$Res>
    implements _$DetailAktivitasModelCopyWith<$Res> {
  __$DetailAktivitasModelCopyWithImpl(this._self, this._then);

  final _DetailAktivitasModel _self;
  final $Res Function(_DetailAktivitasModel) _then;

  /// Create a copy of DetailAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? atasanNip = null,
    Object? atasanNama = null,
    Object? tanggal = null,
    Object? coreValue = null,
    Object? kegiatan = null,
    Object? fotoUrl = null,
    Object? keterangan = null,
    Object? statusAktivitas = null,
  }) {
    return _then(_DetailAktivitasModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      atasanNip: null == atasanNip
          ? _self.atasanNip
          : atasanNip // ignore: cast_nullable_to_non_nullable
              as String,
      atasanNama: null == atasanNama
          ? _self.atasanNama
          : atasanNama // ignore: cast_nullable_to_non_nullable
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
      fotoUrl: null == fotoUrl
          ? _self.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      statusAktivitas: null == statusAktivitas
          ? _self.statusAktivitas
          : statusAktivitas // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
