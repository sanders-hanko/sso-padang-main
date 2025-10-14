// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoreValueModel {
  String get id;
  String get nama;

  /// Create a copy of CoreValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoreValueModelCopyWith<CoreValueModel> get copyWith =>
      _$CoreValueModelCopyWithImpl<CoreValueModel>(
          this as CoreValueModel, _$identity);

  /// Serializes this CoreValueModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoreValueModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama);

  @override
  String toString() {
    return 'CoreValueModel(id: $id, nama: $nama)';
  }
}

/// @nodoc
abstract mixin class $CoreValueModelCopyWith<$Res> {
  factory $CoreValueModelCopyWith(
          CoreValueModel value, $Res Function(CoreValueModel) _then) =
      _$CoreValueModelCopyWithImpl;
  @useResult
  $Res call({String id, String nama});
}

/// @nodoc
class _$CoreValueModelCopyWithImpl<$Res>
    implements $CoreValueModelCopyWith<$Res> {
  _$CoreValueModelCopyWithImpl(this._self, this._then);

  final CoreValueModel _self;
  final $Res Function(CoreValueModel) _then;

  /// Create a copy of CoreValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CoreValueModel implements CoreValueModel {
  _CoreValueModel({required this.id, required this.nama});
  factory _CoreValueModel.fromJson(Map<String, dynamic> json) =>
      _$CoreValueModelFromJson(json);

  @override
  final String id;
  @override
  final String nama;

  /// Create a copy of CoreValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoreValueModelCopyWith<_CoreValueModel> get copyWith =>
      __$CoreValueModelCopyWithImpl<_CoreValueModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoreValueModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoreValueModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama);

  @override
  String toString() {
    return 'CoreValueModel(id: $id, nama: $nama)';
  }
}

/// @nodoc
abstract mixin class _$CoreValueModelCopyWith<$Res>
    implements $CoreValueModelCopyWith<$Res> {
  factory _$CoreValueModelCopyWith(
          _CoreValueModel value, $Res Function(_CoreValueModel) _then) =
      __$CoreValueModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String nama});
}

/// @nodoc
class __$CoreValueModelCopyWithImpl<$Res>
    implements _$CoreValueModelCopyWith<$Res> {
  __$CoreValueModelCopyWithImpl(this._self, this._then);

  final _CoreValueModel _self;
  final $Res Function(_CoreValueModel) _then;

  /// Create a copy of CoreValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nama = null,
  }) {
    return _then(_CoreValueModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
