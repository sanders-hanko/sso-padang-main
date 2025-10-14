// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListSuratModel {
  String get id;
  String get pengirim;
  String get disposisi;
  String get currentUser;
  String get tanggal;
  String get jam;
  String get kodeSurat;
  DetailSuratModel get detail;

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListSuratModelCopyWith<ListSuratModel> get copyWith =>
      _$ListSuratModelCopyWithImpl<ListSuratModel>(
          this as ListSuratModel, _$identity);

  /// Serializes this ListSuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pengirim, pengirim) ||
                other.pengirim == pengirim) &&
            (identical(other.disposisi, disposisi) ||
                other.disposisi == disposisi) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.kodeSurat, kodeSurat) ||
                other.kodeSurat == kodeSurat) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pengirim, disposisi,
      currentUser, tanggal, jam, kodeSurat, detail);

  @override
  String toString() {
    return 'ListSuratModel(id: $id, pengirim: $pengirim, disposisi: $disposisi, currentUser: $currentUser, tanggal: $tanggal, jam: $jam, kodeSurat: $kodeSurat, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class $ListSuratModelCopyWith<$Res> {
  factory $ListSuratModelCopyWith(
          ListSuratModel value, $Res Function(ListSuratModel) _then) =
      _$ListSuratModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String pengirim,
      String disposisi,
      String currentUser,
      String tanggal,
      String jam,
      String kodeSurat,
      DetailSuratModel detail});

  $DetailSuratModelCopyWith<$Res> get detail;
}

/// @nodoc
class _$ListSuratModelCopyWithImpl<$Res>
    implements $ListSuratModelCopyWith<$Res> {
  _$ListSuratModelCopyWithImpl(this._self, this._then);

  final ListSuratModel _self;
  final $Res Function(ListSuratModel) _then;

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pengirim = null,
    Object? disposisi = null,
    Object? currentUser = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? kodeSurat = null,
    Object? detail = null,
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
      disposisi: null == disposisi
          ? _self.disposisi
          : disposisi // ignore: cast_nullable_to_non_nullable
              as String,
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
      kodeSurat: null == kodeSurat
          ? _self.kodeSurat
          : kodeSurat // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as DetailSuratModel,
    ));
  }

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailSuratModelCopyWith<$Res> get detail {
    return $DetailSuratModelCopyWith<$Res>(_self.detail, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ListSuratModel implements ListSuratModel {
  _ListSuratModel(
      {required this.id,
      required this.pengirim,
      required this.disposisi,
      required this.currentUser,
      required this.tanggal,
      required this.jam,
      required this.kodeSurat,
      required this.detail});
  factory _ListSuratModel.fromJson(Map<String, dynamic> json) =>
      _$ListSuratModelFromJson(json);

  @override
  final String id;
  @override
  final String pengirim;
  @override
  final String disposisi;
  @override
  final String currentUser;
  @override
  final String tanggal;
  @override
  final String jam;
  @override
  final String kodeSurat;
  @override
  final DetailSuratModel detail;

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListSuratModelCopyWith<_ListSuratModel> get copyWith =>
      __$ListSuratModelCopyWithImpl<_ListSuratModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListSuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListSuratModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pengirim, pengirim) ||
                other.pengirim == pengirim) &&
            (identical(other.disposisi, disposisi) ||
                other.disposisi == disposisi) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.kodeSurat, kodeSurat) ||
                other.kodeSurat == kodeSurat) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pengirim, disposisi,
      currentUser, tanggal, jam, kodeSurat, detail);

  @override
  String toString() {
    return 'ListSuratModel(id: $id, pengirim: $pengirim, disposisi: $disposisi, currentUser: $currentUser, tanggal: $tanggal, jam: $jam, kodeSurat: $kodeSurat, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class _$ListSuratModelCopyWith<$Res>
    implements $ListSuratModelCopyWith<$Res> {
  factory _$ListSuratModelCopyWith(
          _ListSuratModel value, $Res Function(_ListSuratModel) _then) =
      __$ListSuratModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String pengirim,
      String disposisi,
      String currentUser,
      String tanggal,
      String jam,
      String kodeSurat,
      DetailSuratModel detail});

  @override
  $DetailSuratModelCopyWith<$Res> get detail;
}

/// @nodoc
class __$ListSuratModelCopyWithImpl<$Res>
    implements _$ListSuratModelCopyWith<$Res> {
  __$ListSuratModelCopyWithImpl(this._self, this._then);

  final _ListSuratModel _self;
  final $Res Function(_ListSuratModel) _then;

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? pengirim = null,
    Object? disposisi = null,
    Object? currentUser = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? kodeSurat = null,
    Object? detail = null,
  }) {
    return _then(_ListSuratModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pengirim: null == pengirim
          ? _self.pengirim
          : pengirim // ignore: cast_nullable_to_non_nullable
              as String,
      disposisi: null == disposisi
          ? _self.disposisi
          : disposisi // ignore: cast_nullable_to_non_nullable
              as String,
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
      kodeSurat: null == kodeSurat
          ? _self.kodeSurat
          : kodeSurat // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as DetailSuratModel,
    ));
  }

  /// Create a copy of ListSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailSuratModelCopyWith<$Res> get detail {
    return $DetailSuratModelCopyWith<$Res>(_self.detail, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

// dart format on
