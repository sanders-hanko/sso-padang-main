// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foto_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FotoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FotoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FotoEvent()';
  }
}

/// @nodoc
class $FotoEventCopyWith<$Res> {
  $FotoEventCopyWith(FotoEvent _, $Res Function(FotoEvent) __);
}

/// @nodoc

class _Initial implements FotoEvent {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FotoEvent.initial()';
  }
}

/// @nodoc

class _PickFoto implements FotoEvent {
  const _PickFoto(this.bypassPermission, this.context);

  final bool bypassPermission;
  final BuildContext context;

  /// Create a copy of FotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PickFotoCopyWith<_PickFoto> get copyWith =>
      __$PickFotoCopyWithImpl<_PickFoto>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PickFoto &&
            (identical(other.bypassPermission, bypassPermission) ||
                other.bypassPermission == bypassPermission) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bypassPermission, context);

  @override
  String toString() {
    return 'FotoEvent.pickFoto(bypassPermission: $bypassPermission, context: $context)';
  }
}

/// @nodoc
abstract mixin class _$PickFotoCopyWith<$Res>
    implements $FotoEventCopyWith<$Res> {
  factory _$PickFotoCopyWith(_PickFoto value, $Res Function(_PickFoto) _then) =
      __$PickFotoCopyWithImpl;
  @useResult
  $Res call({bool bypassPermission, BuildContext context});
}

/// @nodoc
class __$PickFotoCopyWithImpl<$Res> implements _$PickFotoCopyWith<$Res> {
  __$PickFotoCopyWithImpl(this._self, this._then);

  final _PickFoto _self;
  final $Res Function(_PickFoto) _then;

  /// Create a copy of FotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bypassPermission = null,
    Object? context = null,
  }) {
    return _then(_PickFoto(
      null == bypassPermission
          ? _self.bypassPermission
          : bypassPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

// dart format on
