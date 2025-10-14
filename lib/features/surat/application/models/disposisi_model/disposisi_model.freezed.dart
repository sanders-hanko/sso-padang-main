// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disposisi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisposisiModel {
  String get suratMasukId;
  String get fromUserNip;
  String get telitiSaran;
  String get toUserNip;

  /// Create a copy of DisposisiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisposisiModelCopyWith<DisposisiModel> get copyWith =>
      _$DisposisiModelCopyWithImpl<DisposisiModel>(
          this as DisposisiModel, _$identity);

  /// Serializes this DisposisiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisposisiModel &&
            (identical(other.suratMasukId, suratMasukId) ||
                other.suratMasukId == suratMasukId) &&
            (identical(other.fromUserNip, fromUserNip) ||
                other.fromUserNip == fromUserNip) &&
            (identical(other.telitiSaran, telitiSaran) ||
                other.telitiSaran == telitiSaran) &&
            (identical(other.toUserNip, toUserNip) ||
                other.toUserNip == toUserNip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, suratMasukId, fromUserNip, telitiSaran, toUserNip);

  @override
  String toString() {
    return 'DisposisiModel(suratMasukId: $suratMasukId, fromUserNip: $fromUserNip, telitiSaran: $telitiSaran, toUserNip: $toUserNip)';
  }
}

/// @nodoc
abstract mixin class $DisposisiModelCopyWith<$Res> {
  factory $DisposisiModelCopyWith(
          DisposisiModel value, $Res Function(DisposisiModel) _then) =
      _$DisposisiModelCopyWithImpl;
  @useResult
  $Res call(
      {String suratMasukId,
      String fromUserNip,
      String telitiSaran,
      String toUserNip});
}

/// @nodoc
class _$DisposisiModelCopyWithImpl<$Res>
    implements $DisposisiModelCopyWith<$Res> {
  _$DisposisiModelCopyWithImpl(this._self, this._then);

  final DisposisiModel _self;
  final $Res Function(DisposisiModel) _then;

  /// Create a copy of DisposisiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suratMasukId = null,
    Object? fromUserNip = null,
    Object? telitiSaran = null,
    Object? toUserNip = null,
  }) {
    return _then(_self.copyWith(
      suratMasukId: null == suratMasukId
          ? _self.suratMasukId
          : suratMasukId // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserNip: null == fromUserNip
          ? _self.fromUserNip
          : fromUserNip // ignore: cast_nullable_to_non_nullable
              as String,
      telitiSaran: null == telitiSaran
          ? _self.telitiSaran
          : telitiSaran // ignore: cast_nullable_to_non_nullable
              as String,
      toUserNip: null == toUserNip
          ? _self.toUserNip
          : toUserNip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DisposisiModel implements DisposisiModel {
  _DisposisiModel(
      {required this.suratMasukId,
      required this.fromUserNip,
      required this.telitiSaran,
      required this.toUserNip});
  factory _DisposisiModel.fromJson(Map<String, dynamic> json) =>
      _$DisposisiModelFromJson(json);

  @override
  final String suratMasukId;
  @override
  final String fromUserNip;
  @override
  final String telitiSaran;
  @override
  final String toUserNip;

  /// Create a copy of DisposisiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisposisiModelCopyWith<_DisposisiModel> get copyWith =>
      __$DisposisiModelCopyWithImpl<_DisposisiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisposisiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisposisiModel &&
            (identical(other.suratMasukId, suratMasukId) ||
                other.suratMasukId == suratMasukId) &&
            (identical(other.fromUserNip, fromUserNip) ||
                other.fromUserNip == fromUserNip) &&
            (identical(other.telitiSaran, telitiSaran) ||
                other.telitiSaran == telitiSaran) &&
            (identical(other.toUserNip, toUserNip) ||
                other.toUserNip == toUserNip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, suratMasukId, fromUserNip, telitiSaran, toUserNip);

  @override
  String toString() {
    return 'DisposisiModel(suratMasukId: $suratMasukId, fromUserNip: $fromUserNip, telitiSaran: $telitiSaran, toUserNip: $toUserNip)';
  }
}

/// @nodoc
abstract mixin class _$DisposisiModelCopyWith<$Res>
    implements $DisposisiModelCopyWith<$Res> {
  factory _$DisposisiModelCopyWith(
          _DisposisiModel value, $Res Function(_DisposisiModel) _then) =
      __$DisposisiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String suratMasukId,
      String fromUserNip,
      String telitiSaran,
      String toUserNip});
}

/// @nodoc
class __$DisposisiModelCopyWithImpl<$Res>
    implements _$DisposisiModelCopyWith<$Res> {
  __$DisposisiModelCopyWithImpl(this._self, this._then);

  final _DisposisiModel _self;
  final $Res Function(_DisposisiModel) _then;

  /// Create a copy of DisposisiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? suratMasukId = null,
    Object? fromUserNip = null,
    Object? telitiSaran = null,
    Object? toUserNip = null,
  }) {
    return _then(_DisposisiModel(
      suratMasukId: null == suratMasukId
          ? _self.suratMasukId
          : suratMasukId // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserNip: null == fromUserNip
          ? _self.fromUserNip
          : fromUserNip // ignore: cast_nullable_to_non_nullable
              as String,
      telitiSaran: null == telitiSaran
          ? _self.telitiSaran
          : telitiSaran // ignore: cast_nullable_to_non_nullable
              as String,
      toUserNip: null == toUserNip
          ? _self.toUserNip
          : toUserNip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
