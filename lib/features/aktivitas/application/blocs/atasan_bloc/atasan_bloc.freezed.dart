// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atasan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AtasanEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AtasanEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AtasanEvent()';
  }
}

/// @nodoc
class $AtasanEventCopyWith<$Res> {
  $AtasanEventCopyWith(AtasanEvent _, $Res Function(AtasanEvent) __);
}

/// @nodoc

class _Fetch implements AtasanEvent {
  const _Fetch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AtasanEvent.fetch()';
  }
}

/// @nodoc

class _Select implements AtasanEvent {
  const _Select(this.atasan, final List<AtasanModel> listAtasan)
      : _listAtasan = listAtasan;

  final AtasanModel atasan;
  final List<AtasanModel> _listAtasan;
  List<AtasanModel> get listAtasan {
    if (_listAtasan is EqualUnmodifiableListView) return _listAtasan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listAtasan);
  }

  /// Create a copy of AtasanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.atasan, atasan) || other.atasan == atasan) &&
            const DeepCollectionEquality()
                .equals(other._listAtasan, _listAtasan));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, atasan, const DeepCollectionEquality().hash(_listAtasan));

  @override
  String toString() {
    return 'AtasanEvent.select(atasan: $atasan, listAtasan: $listAtasan)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $AtasanEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call({AtasanModel atasan, List<AtasanModel> listAtasan});

  $AtasanModelCopyWith<$Res> get atasan;
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of AtasanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? atasan = null,
    Object? listAtasan = null,
  }) {
    return _then(_Select(
      null == atasan
          ? _self.atasan
          : atasan // ignore: cast_nullable_to_non_nullable
              as AtasanModel,
      null == listAtasan
          ? _self._listAtasan
          : listAtasan // ignore: cast_nullable_to_non_nullable
              as List<AtasanModel>,
    ));
  }

  /// Create a copy of AtasanEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AtasanModelCopyWith<$Res> get atasan {
    return $AtasanModelCopyWith<$Res>(_self.atasan, (value) {
      return _then(_self.copyWith(atasan: value));
    });
  }
}

// dart format on
