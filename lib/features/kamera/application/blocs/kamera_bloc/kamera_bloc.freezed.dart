// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kamera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KameraEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'KameraEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KameraEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KameraEvent()';
  }
}

/// @nodoc
class $KameraEventCopyWith<$Res> {
  $KameraEventCopyWith(KameraEvent _, $Res Function(KameraEvent) __);
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements KameraEvent {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'KameraEvent.initial'));
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
    return 'KameraEvent.initial()';
  }
}

/// @nodoc

class _Load with DiagnosticableTreeMixin implements KameraEvent {
  const _Load(this.controller);

  final CameraController controller;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KameraEvent.load'))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Load &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KameraEvent.load(controller: $controller)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res>
    implements $KameraEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) =
      __$LoadCopyWithImpl;
  @useResult
  $Res call({CameraController controller});
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controller = null,
  }) {
    return _then(_Load(
      null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

/// @nodoc

class _SwitchCamera with DiagnosticableTreeMixin implements KameraEvent {
  const _SwitchCamera(this.controller);

  final CameraController controller;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SwitchCameraCopyWith<_SwitchCamera> get copyWith =>
      __$SwitchCameraCopyWithImpl<_SwitchCamera>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KameraEvent.switchCamera'))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwitchCamera &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KameraEvent.switchCamera(controller: $controller)';
  }
}

/// @nodoc
abstract mixin class _$SwitchCameraCopyWith<$Res>
    implements $KameraEventCopyWith<$Res> {
  factory _$SwitchCameraCopyWith(
          _SwitchCamera value, $Res Function(_SwitchCamera) _then) =
      __$SwitchCameraCopyWithImpl;
  @useResult
  $Res call({CameraController controller});
}

/// @nodoc
class __$SwitchCameraCopyWithImpl<$Res>
    implements _$SwitchCameraCopyWith<$Res> {
  __$SwitchCameraCopyWithImpl(this._self, this._then);

  final _SwitchCamera _self;
  final $Res Function(_SwitchCamera) _then;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controller = null,
  }) {
    return _then(_SwitchCamera(
      null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

/// @nodoc

class _TakePicture with DiagnosticableTreeMixin implements KameraEvent {
  const _TakePicture(this.controller);

  final CameraController controller;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TakePictureCopyWith<_TakePicture> get copyWith =>
      __$TakePictureCopyWithImpl<_TakePicture>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KameraEvent.takePicture'))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TakePicture &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KameraEvent.takePicture(controller: $controller)';
  }
}

/// @nodoc
abstract mixin class _$TakePictureCopyWith<$Res>
    implements $KameraEventCopyWith<$Res> {
  factory _$TakePictureCopyWith(
          _TakePicture value, $Res Function(_TakePicture) _then) =
      __$TakePictureCopyWithImpl;
  @useResult
  $Res call({CameraController controller});
}

/// @nodoc
class __$TakePictureCopyWithImpl<$Res> implements _$TakePictureCopyWith<$Res> {
  __$TakePictureCopyWithImpl(this._self, this._then);

  final _TakePicture _self;
  final $Res Function(_TakePicture) _then;

  /// Create a copy of KameraEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controller = null,
  }) {
    return _then(_TakePicture(
      null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

// dart format on
