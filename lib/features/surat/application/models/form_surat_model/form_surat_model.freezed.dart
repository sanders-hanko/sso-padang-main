// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_surat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormSuratModel {
  String get pengirimId;
  String get pengirimNama;
  List<String> get tujuanId;
  String get asisten;
  String get jenis;
  String get perihal;
  String get filePath;

  /// Create a copy of FormSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormSuratModelCopyWith<FormSuratModel> get copyWith =>
      _$FormSuratModelCopyWithImpl<FormSuratModel>(
          this as FormSuratModel, _$identity);

  /// Serializes this FormSuratModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormSuratModel &&
            (identical(other.pengirimId, pengirimId) ||
                other.pengirimId == pengirimId) &&
            (identical(other.pengirimNama, pengirimNama) ||
                other.pengirimNama == pengirimNama) &&
            const DeepCollectionEquality().equals(other.tujuanId, tujuanId) &&
            (identical(other.asisten, asisten) || other.asisten == asisten) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pengirimId,
      pengirimNama,
      const DeepCollectionEquality().hash(tujuanId),
      asisten,
      jenis,
      perihal,
      filePath);

  @override
  String toString() {
    return 'FormSuratModel(pengirimId: $pengirimId, pengirimNama: $pengirimNama, tujuanId: $tujuanId, asisten: $asisten, jenis: $jenis, perihal: $perihal, filePath: $filePath)';
  }
}

/// @nodoc
abstract mixin class $FormSuratModelCopyWith<$Res> {
  factory $FormSuratModelCopyWith(
          FormSuratModel value, $Res Function(FormSuratModel) _then) =
      _$FormSuratModelCopyWithImpl;
  @useResult
  $Res call(
      {String pengirimId,
      String pengirimNama,
      List<String> tujuanId,
      String asisten,
      String jenis,
      String perihal,
      String filePath});
}

/// @nodoc
class _$FormSuratModelCopyWithImpl<$Res>
    implements $FormSuratModelCopyWith<$Res> {
  _$FormSuratModelCopyWithImpl(this._self, this._then);

  final FormSuratModel _self;
  final $Res Function(FormSuratModel) _then;

  /// Create a copy of FormSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pengirimId = null,
    Object? pengirimNama = null,
    Object? tujuanId = null,
    Object? asisten = null,
    Object? jenis = null,
    Object? perihal = null,
    Object? filePath = null,
  }) {
    return _then(_self.copyWith(
      pengirimId: null == pengirimId
          ? _self.pengirimId
          : pengirimId // ignore: cast_nullable_to_non_nullable
              as String,
      pengirimNama: null == pengirimNama
          ? _self.pengirimNama
          : pengirimNama // ignore: cast_nullable_to_non_nullable
              as String,
      tujuanId: null == tujuanId
          ? _self.tujuanId
          : tujuanId // ignore: cast_nullable_to_non_nullable
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
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FormSuratModel implements FormSuratModel {
  _FormSuratModel(
      {required this.pengirimId,
      required this.pengirimNama,
      required final List<String> tujuanId,
      required this.asisten,
      required this.jenis,
      required this.perihal,
      required this.filePath})
      : _tujuanId = tujuanId;
  factory _FormSuratModel.fromJson(Map<String, dynamic> json) =>
      _$FormSuratModelFromJson(json);

  @override
  final String pengirimId;
  @override
  final String pengirimNama;
  final List<String> _tujuanId;
  @override
  List<String> get tujuanId {
    if (_tujuanId is EqualUnmodifiableListView) return _tujuanId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tujuanId);
  }

  @override
  final String asisten;
  @override
  final String jenis;
  @override
  final String perihal;
  @override
  final String filePath;

  /// Create a copy of FormSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormSuratModelCopyWith<_FormSuratModel> get copyWith =>
      __$FormSuratModelCopyWithImpl<_FormSuratModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormSuratModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormSuratModel &&
            (identical(other.pengirimId, pengirimId) ||
                other.pengirimId == pengirimId) &&
            (identical(other.pengirimNama, pengirimNama) ||
                other.pengirimNama == pengirimNama) &&
            const DeepCollectionEquality().equals(other._tujuanId, _tujuanId) &&
            (identical(other.asisten, asisten) || other.asisten == asisten) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.perihal, perihal) || other.perihal == perihal) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pengirimId,
      pengirimNama,
      const DeepCollectionEquality().hash(_tujuanId),
      asisten,
      jenis,
      perihal,
      filePath);

  @override
  String toString() {
    return 'FormSuratModel(pengirimId: $pengirimId, pengirimNama: $pengirimNama, tujuanId: $tujuanId, asisten: $asisten, jenis: $jenis, perihal: $perihal, filePath: $filePath)';
  }
}

/// @nodoc
abstract mixin class _$FormSuratModelCopyWith<$Res>
    implements $FormSuratModelCopyWith<$Res> {
  factory _$FormSuratModelCopyWith(
          _FormSuratModel value, $Res Function(_FormSuratModel) _then) =
      __$FormSuratModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String pengirimId,
      String pengirimNama,
      List<String> tujuanId,
      String asisten,
      String jenis,
      String perihal,
      String filePath});
}

/// @nodoc
class __$FormSuratModelCopyWithImpl<$Res>
    implements _$FormSuratModelCopyWith<$Res> {
  __$FormSuratModelCopyWithImpl(this._self, this._then);

  final _FormSuratModel _self;
  final $Res Function(_FormSuratModel) _then;

  /// Create a copy of FormSuratModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pengirimId = null,
    Object? pengirimNama = null,
    Object? tujuanId = null,
    Object? asisten = null,
    Object? jenis = null,
    Object? perihal = null,
    Object? filePath = null,
  }) {
    return _then(_FormSuratModel(
      pengirimId: null == pengirimId
          ? _self.pengirimId
          : pengirimId // ignore: cast_nullable_to_non_nullable
              as String,
      pengirimNama: null == pengirimNama
          ? _self.pengirimNama
          : pengirimNama // ignore: cast_nullable_to_non_nullable
              as String,
      tujuanId: null == tujuanId
          ? _self._tujuanId
          : tujuanId // ignore: cast_nullable_to_non_nullable
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
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
