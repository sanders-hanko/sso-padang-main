// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailSuratModel {
  String get id;
  String get pengirim;
  String get status;
  List<dynamic>? get disposisi;
  String get perihal;
  List<dynamic>? get tujuan;
  String get currentUser;
  String get tanggal;
  String get jam;
  String get jenis;
  String get path;

  /// Create a copy of DetailSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailSuratModelCopyWith<DetailSuratModel> get copyWith =>
      _$DetailSuratModelCopyWithImpl<DetailSuratModel>(
          this as DetailSuratModel, _$identity);

  /// Serializes this DetailSuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pengirim, pengirim) ||
                other.pengirim == pengirim) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.disposisi, disposisi) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            const DeepCollectionEquality().equals(other.tujuan, tujuan) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pengirim,
      status,
      const DeepCollectionEquality().hash(disposisi),
      perihal,
      const DeepCollectionEquality().hash(tujuan),
      currentUser,
      tanggal,
      jam,
      jenis,
      path);

  @override
  String toString() {
    return 'DetailSuratModel(id: $id, pengirim: $pengirim, status: $status, disposisi: $disposisi, perihal: $perihal, tujuan: $tujuan, currentUser: $currentUser, tanggal: $tanggal, jam: $jam, jenis: $jenis, path: $path)';
  }
}

/// @nodoc
abstract mixin class $DetailSuratModelCopyWith<$Res> {
  factory $DetailSuratModelCopyWith(
          DetailSuratModel value, $Res Function(DetailSuratModel) _then) =
      _$DetailSuratModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String pengirim,
      String status,
      List<dynamic>? disposisi,
      String perihal,
      List<dynamic>? tujuan,
      String currentUser,
      String tanggal,
      String jam,
      String jenis,
      String path});
}

/// @nodoc
class _$DetailSuratModelCopyWithImpl<$Res>
    implements $DetailSuratModelCopyWith<$Res> {
  _$DetailSuratModelCopyWithImpl(this._self, this._then);

  final DetailSuratModel _self;
  final $Res Function(DetailSuratModel) _then;

  /// Create a copy of DetailSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pengirim = null,
    Object? status = null,
    Object? disposisi = freezed,
    Object? perihal = null,
    Object? tujuan = freezed,
    Object? currentUser = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? jenis = null,
    Object? path = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pengirim: null == pengirim
          ? _self.pengirim
          : pengirim // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      disposisi: freezed == disposisi
          ? _self.disposisi
          : disposisi // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      perihal: null == perihal
          ? _self.perihal
          : perihal // ignore: cast_nullable_to_non_nullable
              as String,
      tujuan: freezed == tujuan
          ? _self.tujuan
          : tujuan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      currentUser: null == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      jenis: null == jenis
          ? _self.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DetailSuratModel implements DetailSuratModel {
  _DetailSuratModel(
      {required this.id,
      required this.pengirim,
      required this.status,
      final List<dynamic>? disposisi,
      required this.perihal,
      final List<dynamic>? tujuan,
      required this.currentUser,
      required this.tanggal,
      required this.jam,
      required this.jenis,
      required this.path})
      : _disposisi = disposisi,
        _tujuan = tujuan;
  factory _DetailSuratModel.fromJson(Map<String, dynamic> json) =>
      _$DetailSuratModelFromJson(json);

  @override
  final String id;
  @override
  final String pengirim;
  @override
  final String status;
  final List<dynamic>? _disposisi;
  @override
  List<dynamic>? get disposisi {
    final value = _disposisi;
    if (value == null) return null;
    if (_disposisi is EqualUnmodifiableListView) return _disposisi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String perihal;
  final List<dynamic>? _tujuan;
  @override
  List<dynamic>? get tujuan {
    final value = _tujuan;
    if (value == null) return null;
    if (_tujuan is EqualUnmodifiableListView) return _tujuan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String currentUser;
  @override
  final String tanggal;
  @override
  final String jam;
  @override
  final String jenis;
  @override
  final String path;

  /// Create a copy of DetailSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailSuratModelCopyWith<_DetailSuratModel> get copyWith =>
      __$DetailSuratModelCopyWithImpl<_DetailSuratModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetailSuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pengirim, pengirim) ||
                other.pengirim == pengirim) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._disposisi, _disposisi) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            const DeepCollectionEquality().equals(other._tujuan, _tujuan) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pengirim,
      status,
      const DeepCollectionEquality().hash(_disposisi),
      perihal,
      const DeepCollectionEquality().hash(_tujuan),
      currentUser,
      tanggal,
      jam,
      jenis,
      path);

  @override
  String toString() {
    return 'DetailSuratModel(id: $id, pengirim: $pengirim, status: $status, disposisi: $disposisi, perihal: $perihal, tujuan: $tujuan, currentUser: $currentUser, tanggal: $tanggal, jam: $jam, jenis: $jenis, path: $path)';
  }
}

/// @nodoc
abstract mixin class _$DetailSuratModelCopyWith<$Res>
    implements $DetailSuratModelCopyWith<$Res> {
  factory _$DetailSuratModelCopyWith(
          _DetailSuratModel value, $Res Function(_DetailSuratModel) _then) =
      __$DetailSuratModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String pengirim,
      String status,
      List<dynamic>? disposisi,
      String perihal,
      List<dynamic>? tujuan,
      String currentUser,
      String tanggal,
      String jam,
      String jenis,
      String path});
}

/// @nodoc
class __$DetailSuratModelCopyWithImpl<$Res>
    implements _$DetailSuratModelCopyWith<$Res> {
  __$DetailSuratModelCopyWithImpl(this._self, this._then);

  final _DetailSuratModel _self;
  final $Res Function(_DetailSuratModel) _then;

  /// Create a copy of DetailSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? pengirim = null,
    Object? status = null,
    Object? disposisi = freezed,
    Object? perihal = null,
    Object? tujuan = freezed,
    Object? currentUser = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? jenis = null,
    Object? path = null,
  }) {
    return _then(_DetailSuratModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pengirim: null == pengirim
          ? _self.pengirim
          : pengirim // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      disposisi: freezed == disposisi
          ? _self._disposisi
          : disposisi // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      perihal: null == perihal
          ? _self.perihal
          : perihal // ignore: cast_nullable_to_non_nullable
              as String,
      tujuan: freezed == tujuan
          ? _self._tujuan
          : tujuan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      currentUser: null == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _self.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      jenis: null == jenis
          ? _self.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
