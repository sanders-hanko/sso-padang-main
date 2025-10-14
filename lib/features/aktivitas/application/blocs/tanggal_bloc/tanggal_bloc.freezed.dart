// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tanggal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TanggalEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TanggalEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TanggalEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TanggalEvent()';
  }
}

/// @nodoc
class $TanggalEventCopyWith<$Res> {
  $TanggalEventCopyWith(TanggalEvent _, $Res Function(TanggalEvent) __);
}

/// @nodoc

class _SetDefault with DiagnosticableTreeMixin implements TanggalEvent {
  const _SetDefault();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TanggalEvent.setDefault'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SetDefault);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TanggalEvent.setDefault()';
  }
}

/// @nodoc

class _Select with DiagnosticableTreeMixin implements TanggalEvent {
  const _Select(this.tahun, this.bulan, this.namaBulan, this.tanggal);

  final String tahun;
  final String bulan;
  final String namaBulan;
  final String? tanggal;

  /// Create a copy of TanggalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TanggalEvent.select'))
      ..add(DiagnosticsProperty('tahun', tahun))
      ..add(DiagnosticsProperty('bulan', bulan))
      ..add(DiagnosticsProperty('namaBulan', namaBulan))
      ..add(DiagnosticsProperty('tanggal', tanggal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.namaBulan, namaBulan) ||
                other.namaBulan == namaBulan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tahun, bulan, namaBulan, tanggal);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TanggalEvent.select(tahun: $tahun, bulan: $bulan, namaBulan: $namaBulan, tanggal: $tanggal)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $TanggalEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call({String tahun, String bulan, String namaBulan, String? tanggal});
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of TanggalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tahun = null,
    Object? bulan = null,
    Object? namaBulan = null,
    Object? tanggal = freezed,
  }) {
    return _then(_Select(
      null == tahun
          ? _self.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String,
      null == bulan
          ? _self.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String,
      null == namaBulan
          ? _self.namaBulan
          : namaBulan // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
