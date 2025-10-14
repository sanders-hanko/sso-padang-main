// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulanModel {
  String get bulan;
  String get namaBulan;
  String get tahun;
  String get tanggal;

  /// Create a copy of BulanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BulanModelCopyWith<BulanModel> get copyWith =>
      _$BulanModelCopyWithImpl<BulanModel>(this as BulanModel, _$identity);

  /// Serializes this BulanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BulanModel &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.namaBulan, namaBulan) ||
                other.namaBulan == namaBulan) &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bulan, namaBulan, tahun, tanggal);

  @override
  String toString() {
    return 'BulanModel(bulan: $bulan, namaBulan: $namaBulan, tahun: $tahun, tanggal: $tanggal)';
  }
}

/// @nodoc
abstract mixin class $BulanModelCopyWith<$Res> {
  factory $BulanModelCopyWith(
          BulanModel value, $Res Function(BulanModel) _then) =
      _$BulanModelCopyWithImpl;
  @useResult
  $Res call({String bulan, String namaBulan, String tahun, String tanggal});
}

/// @nodoc
class _$BulanModelCopyWithImpl<$Res> implements $BulanModelCopyWith<$Res> {
  _$BulanModelCopyWithImpl(this._self, this._then);

  final BulanModel _self;
  final $Res Function(BulanModel) _then;

  /// Create a copy of BulanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulan = null,
    Object? namaBulan = null,
    Object? tahun = null,
    Object? tanggal = null,
  }) {
    return _then(_self.copyWith(
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      namaBulan: null == namaBulan
          ? _self.namaBulan
          : namaBulan // ignore: cast_nullable_to_non_nullable
              as String,
      tahun: null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BulanModel implements BulanModel {
  _BulanModel(
      {required this.bulan,
      required this.namaBulan,
      required this.tahun,
      required this.tanggal});
  factory _BulanModel.fromJson(Map<String, dynamic> json) =>
      _$BulanModelFromJson(json);

  @override
  final String bulan;
  @override
  final String namaBulan;
  @override
  final String tahun;
  @override
  final String tanggal;

  /// Create a copy of BulanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BulanModelCopyWith<_BulanModel> get copyWith =>
      __$BulanModelCopyWithImpl<_BulanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BulanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BulanModel &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.namaBulan, namaBulan) ||
                other.namaBulan == namaBulan) &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bulan, namaBulan, tahun, tanggal);

  @override
  String toString() {
    return 'BulanModel(bulan: $bulan, namaBulan: $namaBulan, tahun: $tahun, tanggal: $tanggal)';
  }
}

/// @nodoc
abstract mixin class _$BulanModelCopyWith<$Res>
    implements $BulanModelCopyWith<$Res> {
  factory _$BulanModelCopyWith(
          _BulanModel value, $Res Function(_BulanModel) _then) =
      __$BulanModelCopyWithImpl;
  @override
  @useResult
  $Res call({String bulan, String namaBulan, String tahun, String tanggal});
}

/// @nodoc
class __$BulanModelCopyWithImpl<$Res> implements _$BulanModelCopyWith<$Res> {
  __$BulanModelCopyWithImpl(this._self, this._then);

  final _BulanModel _self;
  final $Res Function(_BulanModel) _then;

  /// Create a copy of BulanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bulan = null,
    Object? namaBulan = null,
    Object? tahun = null,
    Object? tanggal = null,
  }) {
    return _then(_BulanModel(
      bulan: null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      namaBulan: null == namaBulan
          ? _self.namaBulan
          : namaBulan // ignore: cast_nullable_to_non_nullable
              as String,
      tahun: null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
