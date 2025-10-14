// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_aktivitas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListAktivitasModel {
  String get id;
  String get tanggal;
  String get poin;
  String get keterangan;
  String get status;
  Map<String, dynamic> get detail;

  /// Create a copy of ListAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListAktivitasModelCopyWith<ListAktivitasModel> get copyWith =>
      _$ListAktivitasModelCopyWithImpl<ListAktivitasModel>(
          this as ListAktivitasModel, _$identity);

  /// Serializes this ListAktivitasModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListAktivitasModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.poin, poin) || other.poin == poin) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.detail, detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tanggal, poin, keterangan,
      status, const DeepCollectionEquality().hash(detail));

  @override
  String toString() {
    return 'ListAktivitasModel(id: $id, tanggal: $tanggal, poin: $poin, keterangan: $keterangan, status: $status, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class $ListAktivitasModelCopyWith<$Res> {
  factory $ListAktivitasModelCopyWith(
          ListAktivitasModel value, $Res Function(ListAktivitasModel) _then) =
      _$ListAktivitasModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String tanggal,
      String poin,
      String keterangan,
      String status,
      Map<String, dynamic> detail});
}

/// @nodoc
class _$ListAktivitasModelCopyWithImpl<$Res>
    implements $ListAktivitasModelCopyWith<$Res> {
  _$ListAktivitasModelCopyWithImpl(this._self, this._then);

  final ListAktivitasModel _self;
  final $Res Function(ListAktivitasModel) _then;

  /// Create a copy of ListAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tanggal = null,
    Object? poin = null,
    Object? keterangan = null,
    Object? status = null,
    Object? detail = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      poin: null == poin
          ? _self.poin
          : poin // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ListAktivitasModel implements ListAktivitasModel {
  _ListAktivitasModel(
      {required this.id,
      required this.tanggal,
      required this.poin,
      required this.keterangan,
      required this.status,
      required final Map<String, dynamic> detail})
      : _detail = detail;
  factory _ListAktivitasModel.fromJson(Map<String, dynamic> json) =>
      _$ListAktivitasModelFromJson(json);

  @override
  final String id;
  @override
  final String tanggal;
  @override
  final String poin;
  @override
  final String keterangan;
  @override
  final String status;
  final Map<String, dynamic> _detail;
  @override
  Map<String, dynamic> get detail {
    if (_detail is EqualUnmodifiableMapView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_detail);
  }

  /// Create a copy of ListAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListAktivitasModelCopyWith<_ListAktivitasModel> get copyWith =>
      __$ListAktivitasModelCopyWithImpl<_ListAktivitasModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListAktivitasModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListAktivitasModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.poin, poin) || other.poin == poin) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tanggal, poin, keterangan,
      status, const DeepCollectionEquality().hash(_detail));

  @override
  String toString() {
    return 'ListAktivitasModel(id: $id, tanggal: $tanggal, poin: $poin, keterangan: $keterangan, status: $status, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class _$ListAktivitasModelCopyWith<$Res>
    implements $ListAktivitasModelCopyWith<$Res> {
  factory _$ListAktivitasModelCopyWith(
          _ListAktivitasModel value, $Res Function(_ListAktivitasModel) _then) =
      __$ListAktivitasModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String tanggal,
      String poin,
      String keterangan,
      String status,
      Map<String, dynamic> detail});
}

/// @nodoc
class __$ListAktivitasModelCopyWithImpl<$Res>
    implements _$ListAktivitasModelCopyWith<$Res> {
  __$ListAktivitasModelCopyWithImpl(this._self, this._then);

  final _ListAktivitasModel _self;
  final $Res Function(_ListAktivitasModel) _then;

  /// Create a copy of ListAktivitasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tanggal = null,
    Object? poin = null,
    Object? keterangan = null,
    Object? status = null,
    Object? detail = null,
  }) {
    return _then(_ListAktivitasModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      poin: null == poin
          ? _self.poin
          : poin // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _self.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _self._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
