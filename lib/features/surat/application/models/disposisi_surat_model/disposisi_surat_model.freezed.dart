// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disposisi_surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisposisiSuratModel {
  String get id;
  String get nama;
  String get jabatan;
  String get telitiSaran;
  String get toNama;
  String get toJabatan;
  String get toNip;
  String get tanggal;
  String get jam;

  /// Create a copy of DisposisiSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisposisiSuratModelCopyWith<DisposisiSuratModel> get copyWith =>
      _$DisposisiSuratModelCopyWithImpl<DisposisiSuratModel>(
          this as DisposisiSuratModel, _$identity);

  /// Serializes this DisposisiSuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisposisiSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.telitiSaran, telitiSaran) ||
                other.telitiSaran == telitiSaran) &&
            (identical(other.toNama, toNama) || other.toNama == toNama) &&
            (identical(other.toJabatan, toJabatan) ||
                other.toJabatan == toJabatan) &&
            (identical(other.toNip, toNip) || other.toNip == toNip) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, jabatan, telitiSaran,
      toNama, toJabatan, toNip, tanggal, jam);

  @override
  String toString() {
    return 'DisposisiSuratModel(id: $id, nama: $nama, jabatan: $jabatan, telitiSaran: $telitiSaran, toNama: $toNama, toJabatan: $toJabatan, toNip: $toNip, tanggal: $tanggal, jam: $jam)';
  }
}

/// @nodoc
abstract mixin class $DisposisiSuratModelCopyWith<$Res> {
  factory $DisposisiSuratModelCopyWith(
          DisposisiSuratModel value, $Res Function(DisposisiSuratModel) _then) =
      _$DisposisiSuratModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nama,
      String jabatan,
      String telitiSaran,
      String toNama,
      String toJabatan,
      String toNip,
      String tanggal,
      String jam});
}

/// @nodoc
class _$DisposisiSuratModelCopyWithImpl<$Res>
    implements $DisposisiSuratModelCopyWith<$Res> {
  _$DisposisiSuratModelCopyWithImpl(this._self, this._then);

  final DisposisiSuratModel _self;
  final $Res Function(DisposisiSuratModel) _then;

  /// Create a copy of DisposisiSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? telitiSaran = null,
    Object? toNama = null,
    Object? toJabatan = null,
    Object? toNip = null,
    Object? tanggal = null,
    Object? jam = null,
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
      jabatan: null == jabatan
          ? _self.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String,
      telitiSaran: null == telitiSaran
          ? _self.telitiSaran
          : telitiSaran // ignore: cast_nullable_to_non_nullable
              as String,
      toNama: null == toNama
          ? _self.toNama
          : toNama // ignore: cast_nullable_to_non_nullable
              as String,
      toJabatan: null == toJabatan
          ? _self.toJabatan
          : toJabatan // ignore: cast_nullable_to_non_nullable
              as String,
      toNip: null == toNip
          ? _self.toNip
          : toNip // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DisposisiSuratModel implements DisposisiSuratModel {
  _DisposisiSuratModel(
      {required this.id,
      required this.nama,
      required this.jabatan,
      required this.telitiSaran,
      required this.toNama,
      required this.toJabatan,
      required this.toNip,
      required this.tanggal,
      required this.jam});
  factory _DisposisiSuratModel.fromJson(Map<String, dynamic> json) =>
      _$DisposisiSuratModelFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String jabatan;
  @override
  final String telitiSaran;
  @override
  final String toNama;
  @override
  final String toJabatan;
  @override
  final String toNip;
  @override
  final String tanggal;
  @override
  final String jam;

  /// Create a copy of DisposisiSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisposisiSuratModelCopyWith<_DisposisiSuratModel> get copyWith =>
      __$DisposisiSuratModelCopyWithImpl<_DisposisiSuratModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisposisiSuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisposisiSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.telitiSaran, telitiSaran) ||
                other.telitiSaran == telitiSaran) &&
            (identical(other.toNama, toNama) || other.toNama == toNama) &&
            (identical(other.toJabatan, toJabatan) ||
                other.toJabatan == toJabatan) &&
            (identical(other.toNip, toNip) || other.toNip == toNip) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, jabatan, telitiSaran,
      toNama, toJabatan, toNip, tanggal, jam);

  @override
  String toString() {
    return 'DisposisiSuratModel(id: $id, nama: $nama, jabatan: $jabatan, telitiSaran: $telitiSaran, toNama: $toNama, toJabatan: $toJabatan, toNip: $toNip, tanggal: $tanggal, jam: $jam)';
  }
}

/// @nodoc
abstract mixin class _$DisposisiSuratModelCopyWith<$Res>
    implements $DisposisiSuratModelCopyWith<$Res> {
  factory _$DisposisiSuratModelCopyWith(_DisposisiSuratModel value,
          $Res Function(_DisposisiSuratModel) _then) =
      __$DisposisiSuratModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nama,
      String jabatan,
      String telitiSaran,
      String toNama,
      String toJabatan,
      String toNip,
      String tanggal,
      String jam});
}

/// @nodoc
class __$DisposisiSuratModelCopyWithImpl<$Res>
    implements _$DisposisiSuratModelCopyWith<$Res> {
  __$DisposisiSuratModelCopyWithImpl(this._self, this._then);

  final _DisposisiSuratModel _self;
  final $Res Function(_DisposisiSuratModel) _then;

  /// Create a copy of DisposisiSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? telitiSaran = null,
    Object? toNama = null,
    Object? toJabatan = null,
    Object? toNip = null,
    Object? tanggal = null,
    Object? jam = null,
  }) {
    return _then(_DisposisiSuratModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      jabatan: null == jabatan
          ? _self.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String,
      telitiSaran: null == telitiSaran
          ? _self.telitiSaran
          : telitiSaran // ignore: cast_nullable_to_non_nullable
              as String,
      toNama: null == toNama
          ? _self.toNama
          : toNama // ignore: cast_nullable_to_non_nullable
              as String,
      toJabatan: null == toJabatan
          ? _self.toJabatan
          : toJabatan // ignore: cast_nullable_to_non_nullable
              as String,
      toNip: null == toNip
          ? _self.toNip
          : toNip // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
