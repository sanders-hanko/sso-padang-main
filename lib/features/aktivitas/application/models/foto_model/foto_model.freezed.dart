// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FotoModel {
  String get path;
  String get filename;

  /// Create a copy of FotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FotoModelCopyWith<FotoModel> get copyWith =>
      _$FotoModelCopyWithImpl<FotoModel>(this as FotoModel, _$identity);

  /// Serializes this FotoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FotoModel &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, filename);

  @override
  String toString() {
    return 'FotoModel(path: $path, filename: $filename)';
  }
}

/// @nodoc
abstract mixin class $FotoModelCopyWith<$Res> {
  factory $FotoModelCopyWith(FotoModel value, $Res Function(FotoModel) _then) =
      _$FotoModelCopyWithImpl;
  @useResult
  $Res call({String path, String filename});
}

/// @nodoc
class _$FotoModelCopyWithImpl<$Res> implements $FotoModelCopyWith<$Res> {
  _$FotoModelCopyWithImpl(this._self, this._then);

  final FotoModel _self;
  final $Res Function(FotoModel) _then;

  /// Create a copy of FotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? filename = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FotoModel implements FotoModel {
  _FotoModel({required this.path, required this.filename});
  factory _FotoModel.fromJson(Map<String, dynamic> json) =>
      _$FotoModelFromJson(json);

  @override
  final String path;
  @override
  final String filename;

  /// Create a copy of FotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FotoModelCopyWith<_FotoModel> get copyWith =>
      __$FotoModelCopyWithImpl<_FotoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FotoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FotoModel &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, filename);

  @override
  String toString() {
    return 'FotoModel(path: $path, filename: $filename)';
  }
}

/// @nodoc
abstract mixin class _$FotoModelCopyWith<$Res>
    implements $FotoModelCopyWith<$Res> {
  factory _$FotoModelCopyWith(
          _FotoModel value, $Res Function(_FotoModel) _then) =
      __$FotoModelCopyWithImpl;
  @override
  @useResult
  $Res call({String path, String filename});
}

/// @nodoc
class __$FotoModelCopyWithImpl<$Res> implements _$FotoModelCopyWith<$Res> {
  __$FotoModelCopyWithImpl(this._self, this._then);

  final _FotoModel _self;
  final $Res Function(_FotoModel) _then;

  /// Create a copy of FotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? filename = null,
  }) {
    return _then(_FotoModel(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
