// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kegiatan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KegiatanEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'KegiatanEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KegiatanEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KegiatanEvent()';
  }
}

/// @nodoc
class $KegiatanEventCopyWith<$Res> {
  $KegiatanEventCopyWith(KegiatanEvent _, $Res Function(KegiatanEvent) __);
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements KegiatanEvent {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'KegiatanEvent.initial'));
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
    return 'KegiatanEvent.initial()';
  }
}

/// @nodoc

class _Fetch with DiagnosticableTreeMixin implements KegiatanEvent {
  const _Fetch(this.id, this.coreValue);

  final String id;
  final String coreValue;

  /// Create a copy of KegiatanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KegiatanEvent.fetch'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('coreValue', coreValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, coreValue);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KegiatanEvent.fetch(id: $id, coreValue: $coreValue)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $KegiatanEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @useResult
  $Res call({String id, String coreValue});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of KegiatanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? coreValue = null,
  }) {
    return _then(_Fetch(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == coreValue
          ? _self.coreValue
          : coreValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Select with DiagnosticableTreeMixin implements KegiatanEvent {
  const _Select(
      this.coreValue, this.kegiatan, final List<KegiatanModel> listKegiatan)
      : _listKegiatan = listKegiatan;

  final String coreValue;
  final KegiatanModel kegiatan;
  final List<KegiatanModel> _listKegiatan;
  List<KegiatanModel> get listKegiatan {
    if (_listKegiatan is EqualUnmodifiableListView) return _listKegiatan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listKegiatan);
  }

  /// Create a copy of KegiatanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KegiatanEvent.select'))
      ..add(DiagnosticsProperty('coreValue', coreValue))
      ..add(DiagnosticsProperty('kegiatan', kegiatan))
      ..add(DiagnosticsProperty('listKegiatan', listKegiatan));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.coreValue, coreValue) ||
                other.coreValue == coreValue) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            const DeepCollectionEquality()
                .equals(other._listKegiatan, _listKegiatan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coreValue, kegiatan,
      const DeepCollectionEquality().hash(_listKegiatan));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KegiatanEvent.select(coreValue: $coreValue, kegiatan: $kegiatan, listKegiatan: $listKegiatan)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $KegiatanEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call(
      {String coreValue,
      KegiatanModel kegiatan,
      List<KegiatanModel> listKegiatan});

  $KegiatanModelCopyWith<$Res> get kegiatan;
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of KegiatanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coreValue = null,
    Object? kegiatan = null,
    Object? listKegiatan = null,
  }) {
    return _then(_Select(
      null == coreValue
          ? _self.coreValue
          : coreValue // ignore: cast_nullable_to_non_nullable
              as String,
      null == kegiatan
          ? _self.kegiatan
          : kegiatan // ignore: cast_nullable_to_non_nullable
              as KegiatanModel,
      null == listKegiatan
          ? _self._listKegiatan
          : listKegiatan // ignore: cast_nullable_to_non_nullable
              as List<KegiatanModel>,
    ));
  }

  /// Create a copy of KegiatanEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KegiatanModelCopyWith<$Res> get kegiatan {
    return $KegiatanModelCopyWith<$Res>(_self.kegiatan, (value) {
      return _then(_self.copyWith(kegiatan: value));
    });
  }
}

// dart format on
