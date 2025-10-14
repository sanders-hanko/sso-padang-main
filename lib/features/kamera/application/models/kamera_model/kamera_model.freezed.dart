// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kamera_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KameraModel {
  String get path;

  /// Create a copy of KameraModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KameraModelCopyWith<KameraModel> get copyWith =>
      _$KameraModelCopyWithImpl<KameraModel>(this as KameraModel, _$identity);

  /// Serializes this KameraModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KameraModel &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString() {
    return 'KameraModel(path: $path)';
  }
}

/// @nodoc
abstract mixin class $KameraModelCopyWith<$Res> {
  factory $KameraModelCopyWith(
          KameraModel value, $Res Function(KameraModel) _then) =
      _$KameraModelCopyWithImpl;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$KameraModelCopyWithImpl<$Res> implements $KameraModelCopyWith<$Res> {
  _$KameraModelCopyWithImpl(this._self, this._then);

  final KameraModel _self;
  final $Res Function(KameraModel) _then;

  /// Create a copy of KameraModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _KameraModel implements KameraModel {
  _KameraModel({required this.path});
  factory _KameraModel.fromJson(Map<String, dynamic> json) =>
      _$KameraModelFromJson(json);

  @override
  final String path;

  /// Create a copy of KameraModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KameraModelCopyWith<_KameraModel> get copyWith =>
      __$KameraModelCopyWithImpl<_KameraModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KameraModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KameraModel &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString() {
    return 'KameraModel(path: $path)';
  }
}

/// @nodoc
abstract mixin class _$KameraModelCopyWith<$Res>
    implements $KameraModelCopyWith<$Res> {
  factory _$KameraModelCopyWith(
          _KameraModel value, $Res Function(_KameraModel) _then) =
      __$KameraModelCopyWithImpl;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$KameraModelCopyWithImpl<$Res> implements _$KameraModelCopyWith<$Res> {
  __$KameraModelCopyWithImpl(this._self, this._then);

  final _KameraModel _self;
  final $Res Function(_KameraModel) _then;

  /// Create a copy of KameraModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(_KameraModel(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
