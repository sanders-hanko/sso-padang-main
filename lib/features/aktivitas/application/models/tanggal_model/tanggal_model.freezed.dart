// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tanggal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TanggalModel {
  String get tahun;
  String get bulan;
  String? get tanggal;
  String get namaBulan;
  List<int> get listTanggal;

  /// Create a copy of TanggalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TanggalModelCopyWith<TanggalModel> get copyWith =>
      _$TanggalModelCopyWithImpl<TanggalModel>(
          this as TanggalModel, _$identity);

  /// Serializes this TanggalModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TanggalModel &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.namaBulan, namaBulan) ||
                other.namaBulan == namaBulan) &&
            const DeepCollectionEquality()
                .equals(other.listTanggal, listTanggal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tahun, bulan, tanggal, namaBulan,
      const DeepCollectionEquality().hash(listTanggal));

  @override
  String toString() {
    return 'TanggalModel(tahun: $tahun, bulan: $bulan, tanggal: $tanggal, namaBulan: $namaBulan, listTanggal: $listTanggal)';
  }
}

/// @nodoc
abstract mixin class $TanggalModelCopyWith<$Res> {
  factory $TanggalModelCopyWith(
          TanggalModel value, $Res Function(TanggalModel) _then) =
      _$TanggalModelCopyWithImpl;
  @useResult
  $Res call(
      {String tahun,
      String bulan,
      String? tanggal,
      String namaBulan,
      List<int> listTanggal});
}

/// @nodoc
class _$TanggalModelCopyWithImpl<$Res> implements $TanggalModelCopyWith<$Res> {
  _$TanggalModelCopyWithImpl(this._self, this._then);

  final TanggalModel _self;
  final $Res Function(TanggalModel) _then;

  /// Create a copy of TanggalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tahun = null,
    Object? bulan = null,
    Object? tanggal = freezed,
    Object? namaBulan = null,
    Object? listTanggal = null,
  }) {
    return _then(_self.copyWith(
      tahun: null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: freezed == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String?,
      namaBulan: null == namaBulan
          ? _self.namaBulan
          : namaBulan // ignore: cast_nullable_to_non_nullable
              as String,
      listTanggal: null == listTanggal
          ? _self.listTanggal
          : listTanggal // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TanggalModel implements TanggalModel {
  _TanggalModel(
      {required this.tahun,
      required this.bulan,
      required this.tanggal,
      required this.namaBulan,
      required final List<int> listTanggal})
      : _listTanggal = listTanggal;
  factory _TanggalModel.fromJson(Map<String, dynamic> json) =>
      _$TanggalModelFromJson(json);

  @override
  final String tahun;
  @override
  final String bulan;
  @override
  final String? tanggal;
  @override
  final String namaBulan;
  final List<int> _listTanggal;
  @override
  List<int> get listTanggal {
    if (_listTanggal is EqualUnmodifiableListView) return _listTanggal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTanggal);
  }

  /// Create a copy of TanggalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TanggalModelCopyWith<_TanggalModel> get copyWith =>
      __$TanggalModelCopyWithImpl<_TanggalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TanggalModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TanggalModel &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.namaBulan, namaBulan) ||
                other.namaBulan == namaBulan) &&
            const DeepCollectionEquality()
                .equals(other._listTanggal, _listTanggal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tahun, bulan, tanggal, namaBulan,
      const DeepCollectionEquality().hash(_listTanggal));

  @override
  String toString() {
    return 'TanggalModel(tahun: $tahun, bulan: $bulan, tanggal: $tanggal, namaBulan: $namaBulan, listTanggal: $listTanggal)';
  }
}

/// @nodoc
abstract mixin class _$TanggalModelCopyWith<$Res>
    implements $TanggalModelCopyWith<$Res> {
  factory _$TanggalModelCopyWith(
          _TanggalModel value, $Res Function(_TanggalModel) _then) =
      __$TanggalModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tahun,
      String bulan,
      String? tanggal,
      String namaBulan,
      List<int> listTanggal});
}

/// @nodoc
class __$TanggalModelCopyWithImpl<$Res>
    implements _$TanggalModelCopyWith<$Res> {
  __$TanggalModelCopyWithImpl(this._self, this._then);

  final _TanggalModel _self;
  final $Res Function(_TanggalModel) _then;

  /// Create a copy of TanggalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tahun = null,
    Object? bulan = null,
    Object? tanggal = freezed,
    Object? namaBulan = null,
    Object? listTanggal = null,
  }) {
    return _then(_TanggalModel(
      tahun: null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: freezed == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String?,
      namaBulan: null == namaBulan
          ? _self.namaBulan
          : namaBulan // ignore: cast_nullable_to_non_nullable
              as String,
      listTanggal: null == listTanggal
          ? _self._listTanggal
          : listTanggal // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on
