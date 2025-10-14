// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'centang_aktivitas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CentangAktivitasEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CentangAktivitasEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CentangAktivitasEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentangAktivitasEvent()';
  }
}

/// @nodoc
class $CentangAktivitasEventCopyWith<$Res> {
  $CentangAktivitasEventCopyWith(
      CentangAktivitasEvent _, $Res Function(CentangAktivitasEvent) __);
}

/// @nodoc

class _Started with DiagnosticableTreeMixin implements CentangAktivitasEvent {
  const _Started();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CentangAktivitasEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentangAktivitasEvent.started()';
  }
}

/// @nodoc

class _Selesai with DiagnosticableTreeMixin implements CentangAktivitasEvent {
  const _Selesai();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CentangAktivitasEvent.selesai'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Selesai);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentangAktivitasEvent.selesai()';
  }
}

/// @nodoc

class _Select with DiagnosticableTreeMixin implements CentangAktivitasEvent {
  const _Select(this.nip, this.id);

  final String nip;
  final int id;

  /// Create a copy of CentangAktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CentangAktivitasEvent.select'))
      ..add(DiagnosticsProperty('nip', nip))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nip, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentangAktivitasEvent.select(nip: $nip, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $CentangAktivitasEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call({String nip, int id});
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of CentangAktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? id = null,
  }) {
    return _then(_Select(
      null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _Sending with DiagnosticableTreeMixin implements CentangAktivitasEvent {
  const _Sending(this.nip, final List<String?> id, this.statusAktivitas)
      : _id = id;

  final String nip;
  final List<String?> _id;
  List<String?> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  final String statusAktivitas;

  /// Create a copy of CentangAktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendingCopyWith<_Sending> get copyWith =>
      __$SendingCopyWithImpl<_Sending>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CentangAktivitasEvent.sending'))
      ..add(DiagnosticsProperty('nip', nip))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('statusAktivitas', statusAktivitas));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sending &&
            (identical(other.nip, nip) || other.nip == nip) &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            (identical(other.statusAktivitas, statusAktivitas) ||
                other.statusAktivitas == statusAktivitas));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nip,
      const DeepCollectionEquality().hash(_id), statusAktivitas);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentangAktivitasEvent.sending(nip: $nip, id: $id, statusAktivitas: $statusAktivitas)';
  }
}

/// @nodoc
abstract mixin class _$SendingCopyWith<$Res>
    implements $CentangAktivitasEventCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) _then) =
      __$SendingCopyWithImpl;
  @useResult
  $Res call({String nip, List<String?> id, String statusAktivitas});
}

/// @nodoc
class __$SendingCopyWithImpl<$Res> implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(this._self, this._then);

  final _Sending _self;
  final $Res Function(_Sending) _then;

  /// Create a copy of CentangAktivitasEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? id = null,
    Object? statusAktivitas = null,
  }) {
    return _then(_Sending(
      null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _self._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      null == statusAktivitas
          ? _self.statusAktivitas
          : statusAktivitas // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
