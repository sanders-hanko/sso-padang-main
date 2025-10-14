// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etpp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EtppEvent implements DiagnosticableTreeMixin {
  String get tahun;
  String get bulan;

  /// Create a copy of EtppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EtppEventCopyWith<EtppEvent> get copyWith =>
      _$EtppEventCopyWithImpl<EtppEvent>(this as EtppEvent, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'EtppEvent'))
      ..add(DiagnosticsProperty('tahun', tahun))
      ..add(DiagnosticsProperty('bulan', bulan));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EtppEvent &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.bulan, bulan) || other.bulan == bulan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tahun, bulan);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EtppEvent(tahun: $tahun, bulan: $bulan)';
  }
}

/// @nodoc
abstract mixin class $EtppEventCopyWith<$Res> {
  factory $EtppEventCopyWith(EtppEvent value, $Res Function(EtppEvent) _then) =
      _$EtppEventCopyWithImpl;
  @useResult
  $Res call({String tahun, String bulan});
}

/// @nodoc
class _$EtppEventCopyWithImpl<$Res> implements $EtppEventCopyWith<$Res> {
  _$EtppEventCopyWithImpl(this._self, this._then);

  final EtppEvent _self;
  final $Res Function(EtppEvent) _then;

  /// Create a copy of EtppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tahun = null,
    Object? bulan = null,
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
    ));
  }
}

/// @nodoc

class _Fetch with DiagnosticableTreeMixin implements EtppEvent {
  const _Fetch(this.tahun, this.bulan);

  @override
  final String tahun;
  @override
  final String bulan;

  /// Create a copy of EtppEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'EtppEvent.fetch'))
      ..add(DiagnosticsProperty('tahun', tahun))
      ..add(DiagnosticsProperty('bulan', bulan));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.bulan, bulan) || other.bulan == bulan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tahun, bulan);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EtppEvent.fetch(tahun: $tahun, bulan: $bulan)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $EtppEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @override
  @useResult
  $Res call({String tahun, String bulan});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of EtppEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tahun = null,
    Object? bulan = null,
  }) {
    return _then(_Fetch(
      null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
