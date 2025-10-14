// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_value_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoreValueEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CoreValueEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoreValueEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoreValueEvent()';
  }
}

/// @nodoc
class $CoreValueEventCopyWith<$Res> {
  $CoreValueEventCopyWith(CoreValueEvent _, $Res Function(CoreValueEvent) __);
}

/// @nodoc

class _Fetch with DiagnosticableTreeMixin implements CoreValueEvent {
  const _Fetch();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CoreValueEvent.fetch'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoreValueEvent.fetch()';
  }
}

/// @nodoc

class _Select with DiagnosticableTreeMixin implements CoreValueEvent {
  const _Select(this.coreValue, final List<CoreValueModel> listCoreValue)
      : _listCoreValue = listCoreValue;

  final CoreValueModel coreValue;
  final List<CoreValueModel> _listCoreValue;
  List<CoreValueModel> get listCoreValue {
    if (_listCoreValue is EqualUnmodifiableListView) return _listCoreValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCoreValue);
  }

  /// Create a copy of CoreValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CoreValueEvent.select'))
      ..add(DiagnosticsProperty('coreValue', coreValue))
      ..add(DiagnosticsProperty('listCoreValue', listCoreValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            const DeepCollectionEquality()
                .equals(other._listCoreValue, _listCoreValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coreValue,
      const DeepCollectionEquality().hash(_listCoreValue));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoreValueEvent.select(coreValue: $coreValue, listCoreValue: $listCoreValue)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $CoreValueEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call({CoreValueModel coreValue, List<CoreValueModel> listCoreValue});

  $CoreValueModelCopyWith<$Res> get coreValue;
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of CoreValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coreValue = null,
    Object? listCoreValue = null,
  }) {
    return _then(_Select(
      null == coreValue
          ? _self.coreValue
          : coreValue // ignore: cast_nullable_to_non_nullable
              as CoreValueModel,
      null == listCoreValue
          ? _self._listCoreValue
          : listCoreValue // ignore: cast_nullable_to_non_nullable
              as List<CoreValueModel>,
    ));
  }

  /// Create a copy of CoreValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoreValueModelCopyWith<$Res> get coreValue {
    return $CoreValueModelCopyWith<$Res>(_self.coreValue, (value) {
      return _then(_self.copyWith(coreValue: value));
    });
  }
}

// dart format on
