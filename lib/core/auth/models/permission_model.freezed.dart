// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionModel {
  String get id;
  String get accessKode;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PermissionModelCopyWith<PermissionModel> get copyWith =>
      _$PermissionModelCopyWithImpl<PermissionModel>(
          this as PermissionModel, _$identity);

  /// Serializes this PermissionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PermissionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessKode, accessKode) ||
                other.accessKode == accessKode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, accessKode);

  @override
  String toString() {
    return 'PermissionModel(id: $id, accessKode: $accessKode)';
  }
}

/// @nodoc
abstract mixin class $PermissionModelCopyWith<$Res> {
  factory $PermissionModelCopyWith(
          PermissionModel value, $Res Function(PermissionModel) _then) =
      _$PermissionModelCopyWithImpl;
  @useResult
  $Res call({String id, String accessKode});
}

/// @nodoc
class _$PermissionModelCopyWithImpl<$Res>
    implements $PermissionModelCopyWith<$Res> {
  _$PermissionModelCopyWithImpl(this._self, this._then);

  final PermissionModel _self;
  final $Res Function(PermissionModel) _then;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessKode = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accessKode: null == accessKode
          ? _self.accessKode
          : accessKode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PermissionModel implements PermissionModel {
  _PermissionModel({required this.id, required this.accessKode});
  factory _PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  @override
  final String id;
  @override
  final String accessKode;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionModelCopyWith<_PermissionModel> get copyWith =>
      __$PermissionModelCopyWithImpl<_PermissionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PermissionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessKode, accessKode) ||
                other.accessKode == accessKode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, accessKode);

  @override
  String toString() {
    return 'PermissionModel(id: $id, accessKode: $accessKode)';
  }
}

/// @nodoc
abstract mixin class _$PermissionModelCopyWith<$Res>
    implements $PermissionModelCopyWith<$Res> {
  factory _$PermissionModelCopyWith(
          _PermissionModel value, $Res Function(_PermissionModel) _then) =
      __$PermissionModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String accessKode});
}

/// @nodoc
class __$PermissionModelCopyWithImpl<$Res>
    implements _$PermissionModelCopyWith<$Res> {
  __$PermissionModelCopyWithImpl(this._self, this._then);

  final _PermissionModel _self;
  final $Res Function(_PermissionModel) _then;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? accessKode = null,
  }) {
    return _then(_PermissionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accessKode: null == accessKode
          ? _self.accessKode
          : accessKode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
