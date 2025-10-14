// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuratModel {
  String get id;
  String get dari;
  List<String> get tujuan;
  String get asisten;
  String get jenis;
  String get perihal;
  String get berkas;
  String get status;
  String get tanggal;
  String get jam;
  bool get read;

  /// Create a copy of SuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuratModelCopyWith<SuratModel> get copyWith =>
      _$SuratModelCopyWithImpl<SuratModel>(this as SuratModel, _$identity);

  /// Serializes this SuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dari, dari) || other.dari == dari) &&
            const DeepCollectionEquality().equals(other.tujuan, tujuan) &&
            (identical(other.asisten, asisten) || other.asisten == asisten) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            (identical(other.berkas, berkas) || other.berkas == berkas) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dari,
      const DeepCollectionEquality().hash(tujuan),
      asisten,
      jenis,
      perihal,
      berkas,
      status,
      tanggal,
      jam,
      read);

  @override
  String toString() {
    return 'SuratModel(id: $id, dari: $dari, tujuan: $tujuan, asisten: $asisten, jenis: $jenis, perihal: $perihal, berkas: $berkas, status: $status, tanggal: $tanggal, jam: $jam, read: $read)';
  }
}

/// @nodoc
abstract mixin class $SuratModelCopyWith<$Res> {
  factory $SuratModelCopyWith(
          SuratModel value, $Res Function(SuratModel) _then) =
      _$SuratModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String dari,
      List<String> tujuan,
      String asisten,
      String jenis,
      String perihal,
      String berkas,
      String status,
      String tanggal,
      String jam,
      bool read});
}

/// @nodoc
class _$SuratModelCopyWithImpl<$Res> implements $SuratModelCopyWith<$Res> {
  _$SuratModelCopyWithImpl(this._self, this._then);

  final SuratModel _self;
  final $Res Function(SuratModel) _then;

  /// Create a copy of SuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dari = null,
    Object? tujuan = null,
    Object? asisten = null,
    Object? jenis = null,
    Object? perihal = null,
    Object? berkas = null,
    Object? status = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? read = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dari: null == dari
          ? _self.dari
          : dari // ignore: cast_nullable_to_non_nullable
              as String,
      tujuan: null == tujuan
          ? _self.tujuan
          : tujuan // ignore: cast_nullable_to_non_nullable
              as List<String>,
      asisten: null == asisten
          ? _self.asisten
          : asisten // ignore: cast_nullable_to_non_nullable
              as String,
      jenis: null == jenis
          ? _self.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as String,
      perihal: null == perihal
          ? _self.perihal
          : perihal // ignore: cast_nullable_to_non_nullable
              as String,
      berkas: null == berkas
          ? _self.berkas
          : berkas // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _self.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuratModel implements SuratModel {
  _SuratModel(
      {required this.id,
      required this.dari,
      required final List<String> tujuan,
      required this.asisten,
      required this.jenis,
      required this.perihal,
      required this.berkas,
      required this.status,
      required this.tanggal,
      required this.jam,
      required this.read})
      : _tujuan = tujuan;
  factory _SuratModel.fromJson(Map<String, dynamic> json) =>
      _$SuratModelFromJson(json);

  @override
  final String id;
  @override
  final String dari;
  final List<String> _tujuan;
  @override
  List<String> get tujuan {
    if (_tujuan is EqualUnmodifiableListView) return _tujuan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tujuan);
  }

  @override
  final String asisten;
  @override
  final String jenis;
  @override
  final String perihal;
  @override
  final String berkas;
  @override
  final String status;
  @override
  final String tanggal;
  @override
  final String jam;
  @override
  final bool read;

  /// Create a copy of SuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuratModelCopyWith<_SuratModel> get copyWith =>
      __$SuratModelCopyWithImpl<_SuratModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dari, dari) || other.dari == dari) &&
            const DeepCollectionEquality().equals(other._tujuan, _tujuan) &&
            (identical(other.asisten, asisten) || other.asisten == asisten) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            (identical(other.berkas, berkas) || other.berkas == berkas) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dari,
      const DeepCollectionEquality().hash(_tujuan),
      asisten,
      jenis,
      perihal,
      berkas,
      status,
      tanggal,
      jam,
      read);

  @override
  String toString() {
    return 'SuratModel(id: $id, dari: $dari, tujuan: $tujuan, asisten: $asisten, jenis: $jenis, perihal: $perihal, berkas: $berkas, status: $status, tanggal: $tanggal, jam: $jam, read: $read)';
  }
}

/// @nodoc
abstract mixin class _$SuratModelCopyWith<$Res>
    implements $SuratModelCopyWith<$Res> {
  factory _$SuratModelCopyWith(
          _SuratModel value, $Res Function(_SuratModel) _then) =
      __$SuratModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String dari,
      List<String> tujuan,
      String asisten,
      String jenis,
      String perihal,
      String berkas,
      String status,
      String tanggal,
      String jam,
      bool read});
}

/// @nodoc
class __$SuratModelCopyWithImpl<$Res> implements _$SuratModelCopyWith<$Res> {
  __$SuratModelCopyWithImpl(this._self, this._then);

  final _SuratModel _self;
  final $Res Function(_SuratModel) _then;

  /// Create a copy of SuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? dari = null,
    Object? tujuan = null,
    Object? asisten = null,
    Object? jenis = null,
    Object? perihal = null,
    Object? berkas = null,
    Object? status = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? read = null,
  }) {
    return _then(_SuratModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dari: null == dari
          ? _self.dari
          : dari // ignore: cast_nullable_to_non_nullable
              as String,
      tujuan: null == tujuan
          ? _self._tujuan
          : tujuan // ignore: cast_nullable_to_non_nullable
              as List<String>,
      asisten: null == asisten
          ? _self.asisten
          : asisten // ignore: cast_nullable_to_non_nullable
              as String,
      jenis: null == jenis
          ? _self.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as String,
      perihal: null == perihal
          ? _self.perihal
          : perihal // ignore: cast_nullable_to_non_nullable
              as String,
      berkas: null == berkas
          ? _self.berkas
          : berkas // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _self.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
