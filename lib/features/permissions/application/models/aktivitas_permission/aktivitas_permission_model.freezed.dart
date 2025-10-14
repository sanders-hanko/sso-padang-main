// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aktivitas_permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AktivitasPermissionModel {
  bool get createPermission;
  bool get evaluationPermission;
  bool get bypassPermission;

  /// Create a copy of AktivitasPermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AktivitasPermissionModelCopyWith<AktivitasPermissionModel> get copyWith =>
      _$AktivitasPermissionModelCopyWithImpl<AktivitasPermissionModel>(
          this as AktivitasPermissionModel, _$identity);

  /// Serializes this AktivitasPermissionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AktivitasPermissionModel &&
            (identical(other.createPermission, createPermission) ||
                other.createPermission == createPermission) &&
            (identical(other.evaluationPermission, evaluationPermission) ||
                other.evaluationPermission == evaluationPermission) &&
            (identical(other.bypassPermission, bypassPermission) ||
                other.bypassPermission == bypassPermission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, createPermission, evaluationPermission, bypassPermission);

  @override
  String toString() {
    return 'AktivitasPermissionModel(createPermission: $createPermission, evaluationPermission: $evaluationPermission, bypassPermission: $bypassPermission)';
  }
}

/// @nodoc
abstract mixin class $AktivitasPermissionModelCopyWith<$Res> {
  factory $AktivitasPermissionModelCopyWith(AktivitasPermissionModel value,
          $Res Function(AktivitasPermissionModel) _then) =
      _$AktivitasPermissionModelCopyWithImpl;
  @useResult
  $Res call(
      {bool createPermission,
      bool evaluationPermission,
      bool bypassPermission});
}

/// @nodoc
class _$AktivitasPermissionModelCopyWithImpl<$Res>
    implements $AktivitasPermissionModelCopyWith<$Res> {
  _$AktivitasPermissionModelCopyWithImpl(this._self, this._then);

  final AktivitasPermissionModel _self;
  final $Res Function(AktivitasPermissionModel) _then;

  /// Create a copy of AktivitasPermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createPermission = null,
    Object? evaluationPermission = null,
    Object? bypassPermission = null,
  }) {
    return _then(_self.copyWith(
      createPermission: null == createPermission
          ? _self.createPermission
          : createPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      evaluationPermission: null == evaluationPermission
          ? _self.evaluationPermission
          : evaluationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      bypassPermission: null == bypassPermission
          ? _self.bypassPermission
          : bypassPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AktivitasPermissionModel implements AktivitasPermissionModel {
  _AktivitasPermissionModel(
      {required this.createPermission,
      required this.evaluationPermission,
      required this.bypassPermission});
  factory _AktivitasPermissionModel.fromJson(Map<String, dynamic> json) =>
      _$AktivitasPermissionModelFromJson(json);

  @override
  final bool createPermission;
  @override
  final bool evaluationPermission;
  @override
  final bool bypassPermission;

  /// Create a copy of AktivitasPermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AktivitasPermissionModelCopyWith<_AktivitasPermissionModel> get copyWith =>
      __$AktivitasPermissionModelCopyWithImpl<_AktivitasPermissionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AktivitasPermissionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AktivitasPermissionModel &&
            (identical(other.createPermission, createPermission) ||
                other.createPermission == createPermission) &&
            (identical(other.evaluationPermission, evaluationPermission) ||
                other.evaluationPermission == evaluationPermission) &&
            (identical(other.bypassPermission, bypassPermission) ||
                other.bypassPermission == bypassPermission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, createPermission, evaluationPermission, bypassPermission);

  @override
  String toString() {
    return 'AktivitasPermissionModel(createPermission: $createPermission, evaluationPermission: $evaluationPermission, bypassPermission: $bypassPermission)';
  }
}

/// @nodoc
abstract mixin class _$AktivitasPermissionModelCopyWith<$Res>
    implements $AktivitasPermissionModelCopyWith<$Res> {
  factory _$AktivitasPermissionModelCopyWith(_AktivitasPermissionModel value,
          $Res Function(_AktivitasPermissionModel) _then) =
      __$AktivitasPermissionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool createPermission,
      bool evaluationPermission,
      bool bypassPermission});
}

/// @nodoc
class __$AktivitasPermissionModelCopyWithImpl<$Res>
    implements _$AktivitasPermissionModelCopyWith<$Res> {
  __$AktivitasPermissionModelCopyWithImpl(this._self, this._then);

  final _AktivitasPermissionModel _self;
  final $Res Function(_AktivitasPermissionModel) _then;

  /// Create a copy of AktivitasPermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? createPermission = null,
    Object? evaluationPermission = null,
    Object? bypassPermission = null,
  }) {
    return _then(_AktivitasPermissionModel(
      createPermission: null == createPermission
          ? _self.createPermission
          : createPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      evaluationPermission: null == evaluationPermission
          ? _self.evaluationPermission
          : evaluationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      bypassPermission: null == bypassPermission
          ? _self.bypassPermission
          : bypassPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
