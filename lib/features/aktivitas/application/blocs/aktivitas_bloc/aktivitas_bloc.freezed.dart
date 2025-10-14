// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aktivitas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AktivitasEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AktivitasEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AktivitasEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AktivitasEvent()';
  }
}

/// @nodoc
class $AktivitasEventCopyWith<$Res> {
  $AktivitasEventCopyWith(AktivitasEvent _, $Res Function(AktivitasEvent) __);
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements AktivitasEvent {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AktivitasEvent.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AktivitasEvent.initial()';
  }
}

/// @nodoc

class _Fetch with DiagnosticableTreeMixin implements AktivitasEvent {
  const _Fetch(this.nip, this.tanggal);

  final String nip;
  final String tanggal;

  /// Create a copy of AktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AktivitasEvent.fetch'))
      ..add(DiagnosticsProperty('nip', nip))
      ..add(DiagnosticsProperty('tanggal', tanggal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nip, tanggal);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AktivitasEvent.fetch(nip: $nip, tanggal: $tanggal)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $AktivitasEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @useResult
  $Res call({String nip, String tanggal});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of AktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? tanggal = null,
  }) {
    return _then(_Fetch(
      null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == tanggal
          ? _self.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
