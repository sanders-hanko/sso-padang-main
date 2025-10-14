// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disposisi_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisposisiEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DisposisiEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DisposisiEvent()';
  }
}

/// @nodoc
class $DisposisiEventCopyWith<$Res> {
  $DisposisiEventCopyWith(DisposisiEvent _, $Res Function(DisposisiEvent) __);
}

/// @nodoc

class _Fetch implements DisposisiEvent {
  const _Fetch(this.id);

  final String id;

  /// Create a copy of DisposisiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'DisposisiEvent.fetch(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $DisposisiEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of DisposisiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_Fetch(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Send implements DisposisiEvent {
  const _Send(this.suratId, this.fromNip, this.telitiSaran, this.toNip);

  final String suratId;
  final String fromNip;
  final String telitiSaran;
  final String toNip;

  /// Create a copy of DisposisiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendCopyWith<_Send> get copyWith =>
      __$SendCopyWithImpl<_Send>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Send &&
            (identical(other.suratId, suratId) || other.suratId == suratId) &&
            (identical(other.fromNip, fromNip) || other.fromNip == fromNip) &&
            (identical(other.telitiSaran, telitiSaran) ||
                other.telitiSaran == telitiSaran) &&
            (identical(other.toNip, toNip) || other.toNip == toNip));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, suratId, fromNip, telitiSaran, toNip);

  @override
  String toString() {
    return 'DisposisiEvent.send(suratId: $suratId, fromNip: $fromNip, telitiSaran: $telitiSaran, toNip: $toNip)';
  }
}

/// @nodoc
abstract mixin class _$SendCopyWith<$Res>
    implements $DisposisiEventCopyWith<$Res> {
  factory _$SendCopyWith(_Send value, $Res Function(_Send) _then) =
      __$SendCopyWithImpl;
  @useResult
  $Res call({String suratId, String fromNip, String telitiSaran, String toNip});
}

/// @nodoc
class __$SendCopyWithImpl<$Res> implements _$SendCopyWith<$Res> {
  __$SendCopyWithImpl(this._self, this._then);

  final _Send _self;
  final $Res Function(_Send) _then;

  /// Create a copy of DisposisiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? suratId = null,
    Object? fromNip = null,
    Object? telitiSaran = null,
    Object? toNip = null,
  }) {
    return _then(_Send(
      null == suratId
          ? _self.suratId
          : suratId // ignore: cast_nullable_to_non_nullable
              as String,
      null == fromNip
          ? _self.fromNip
          : fromNip // ignore: cast_nullable_to_non_nullable
              as String,
      null == telitiSaran
          ? _self.telitiSaran
          : telitiSaran // ignore: cast_nullable_to_non_nullable
              as String,
      null == toNip
          ? _self.toNip
          : toNip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
