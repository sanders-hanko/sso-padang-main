// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_nama_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListNamaModel {
  String get nip;
  String get nama;
  String get jabatan;
  String get jumlahAktivitas;
  String get capaian;
  String get bulan;
  List<Map<String, dynamic>> get aktivitasHarian;

  /// Create a copy of ListNamaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListNamaModelCopyWith<ListNamaModel> get copyWith =>
      _$ListNamaModelCopyWithImpl<ListNamaModel>(
          this as ListNamaModel, _$identity);

  /// Serializes this ListNamaModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListNamaModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.jumlahAktivitas, jumlahAktivitas) ||
                other.jumlahAktivitas == jumlahAktivitas) &&
            (identical(other.capaian, capaian) || other.capaian == capaian) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            const DeepCollectionEquality()
                .equals(other.aktivitasHarian, aktivitasHarian));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nip,
      nama,
      jabatan,
      jumlahAktivitas,
      capaian,
      bulan,
      const DeepCollectionEquality().hash(aktivitasHarian));

  @override
  String toString() {
    return 'ListNamaModel(nip: $nip, nama: $nama, jabatan: $jabatan, jumlahAktivitas: $jumlahAktivitas, capaian: $capaian, bulan: $bulan, aktivitasHarian: $aktivitasHarian)';
  }
}

/// @nodoc
abstract mixin class $ListNamaModelCopyWith<$Res> {
  factory $ListNamaModelCopyWith(
          ListNamaModel value, $Res Function(ListNamaModel) _then) =
      _$ListNamaModelCopyWithImpl;
  @useResult
  $Res call(
      {String nip,
      String nama,
      String jabatan,
      String jumlahAktivitas,
      String capaian,
      String bulan,
      List<Map<String, dynamic>> aktivitasHarian});
}

/// @nodoc
class _$ListNamaModelCopyWithImpl<$Res>
    implements $ListNamaModelCopyWith<$Res> {
  _$ListNamaModelCopyWithImpl(this._self, this._then);

  final ListNamaModel _self;
  final $Res Function(ListNamaModel) _then;

  /// Create a copy of ListNamaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? jumlahAktivitas = null,
    Object? capaian = null,
    Object? bulan = null,
    Object? aktivitasHarian = null,
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
      jumlahAktivitas: null == jumlahAktivitas
          ? _self.jumlahAktivitas
          : jumlahAktivitas // ignore: cast_nullable_to_non_nullable
              as String,
      capaian: null == capaian
          ? _self.capaian
          : capaian // ignore: cast_nullable_to_non_nullable
              as String,
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      aktivitasHarian: null == aktivitasHarian
          ? _self.aktivitasHarian
          : aktivitasHarian // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ListNamaModel implements ListNamaModel {
  _ListNamaModel(
      {required this.nip,
      required this.nama,
      required this.jabatan,
      required this.jumlahAktivitas,
      required this.capaian,
      required this.bulan,
      required final List<Map<String, dynamic>> aktivitasHarian})
      : _aktivitasHarian = aktivitasHarian;
  factory _ListNamaModel.fromJson(Map<String, dynamic> json) =>
      _$ListNamaModelFromJson(json);

  @override
  final String nip;
  @override
  final String nama;
  @override
  final String jabatan;
  @override
  final String jumlahAktivitas;
  @override
  final String capaian;
  @override
  final String bulan;
  final List<Map<String, dynamic>> _aktivitasHarian;
  @override
  List<Map<String, dynamic>> get aktivitasHarian {
    if (_aktivitasHarian is EqualUnmodifiableListView) return _aktivitasHarian;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aktivitasHarian);
  }

  /// Create a copy of ListNamaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListNamaModelCopyWith<_ListNamaModel> get copyWith =>
      __$ListNamaModelCopyWithImpl<_ListNamaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListNamaModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListNamaModel &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.jumlahAktivitas, jumlahAktivitas) ||
                other.jumlahAktivitas == jumlahAktivitas) &&
            (identical(other.capaian, capaian) || other.capaian == capaian) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            const DeepCollectionEquality()
                .equals(other._aktivitasHarian, _aktivitasHarian));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nip,
      nama,
      jabatan,
      jumlahAktivitas,
      capaian,
      bulan,
      const DeepCollectionEquality().hash(_aktivitasHarian));

  @override
  String toString() {
    return 'ListNamaModel(nip: $nip, nama: $nama, jabatan: $jabatan, jumlahAktivitas: $jumlahAktivitas, capaian: $capaian, bulan: $bulan, aktivitasHarian: $aktivitasHarian)';
  }
}

/// @nodoc
abstract mixin class _$ListNamaModelCopyWith<$Res>
    implements $ListNamaModelCopyWith<$Res> {
  factory _$ListNamaModelCopyWith(
          _ListNamaModel value, $Res Function(_ListNamaModel) _then) =
      __$ListNamaModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String nip,
      String nama,
      String jabatan,
      String jumlahAktivitas,
      String capaian,
      String bulan,
      List<Map<String, dynamic>> aktivitasHarian});
}

/// @nodoc
class __$ListNamaModelCopyWithImpl<$Res>
    implements _$ListNamaModelCopyWith<$Res> {
  __$ListNamaModelCopyWithImpl(this._self, this._then);

  final _ListNamaModel _self;
  final $Res Function(_ListNamaModel) _then;

  /// Create a copy of ListNamaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? jumlahAktivitas = null,
    Object? capaian = null,
    Object? bulan = null,
    Object? aktivitasHarian = null,
  }) {
    return _then(_ListNamaModel(
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
      jumlahAktivitas: null == jumlahAktivitas
          ? _self.jumlahAktivitas
          : jumlahAktivitas // ignore: cast_nullable_to_non_nullable
              as String,
      capaian: null == capaian
          ? _self.capaian
          : capaian // ignore: cast_nullable_to_non_nullable
              as String,
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      aktivitasHarian: null == aktivitasHarian
          ? _self._aktivitasHarian
          : aktivitasHarian // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

// dart format on
