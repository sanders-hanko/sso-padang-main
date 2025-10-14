// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormInputEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormInputEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormInputEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent()';
  }
}

/// @nodoc
class $FormInputEventCopyWith<$Res> {
  $FormInputEventCopyWith(FormInputEvent _, $Res Function(FormInputEvent) __);
}

/// @nodoc

class _FetchOrganisasi with DiagnosticableTreeMixin implements FormInputEvent {
  const _FetchOrganisasi(this.label);

  final String label;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchOrganisasiCopyWith<_FetchOrganisasi> get copyWith =>
      __$FetchOrganisasiCopyWithImpl<_FetchOrganisasi>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormInputEvent.fetchOrganisasi'))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchOrganisasi &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.fetchOrganisasi(label: $label)';
  }
}

/// @nodoc
abstract mixin class _$FetchOrganisasiCopyWith<$Res>
    implements $FormInputEventCopyWith<$Res> {
  factory _$FetchOrganisasiCopyWith(
          _FetchOrganisasi value, $Res Function(_FetchOrganisasi) _then) =
      __$FetchOrganisasiCopyWithImpl;
  @useResult
  $Res call({String label});
}

/// @nodoc
class __$FetchOrganisasiCopyWithImpl<$Res>
    implements _$FetchOrganisasiCopyWith<$Res> {
  __$FetchOrganisasiCopyWithImpl(this._self, this._then);

  final _FetchOrganisasi _self;
  final $Res Function(_FetchOrganisasi) _then;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
  }) {
    return _then(_FetchOrganisasi(
      null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _FetchAsisten with DiagnosticableTreeMixin implements FormInputEvent {
  const _FetchAsisten(this.label);

  final String label;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchAsistenCopyWith<_FetchAsisten> get copyWith =>
      __$FetchAsistenCopyWithImpl<_FetchAsisten>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormInputEvent.fetchAsisten'))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchAsisten &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.fetchAsisten(label: $label)';
  }
}

/// @nodoc
abstract mixin class _$FetchAsistenCopyWith<$Res>
    implements $FormInputEventCopyWith<$Res> {
  factory _$FetchAsistenCopyWith(
          _FetchAsisten value, $Res Function(_FetchAsisten) _then) =
      __$FetchAsistenCopyWithImpl;
  @useResult
  $Res call({String label});
}

/// @nodoc
class __$FetchAsistenCopyWithImpl<$Res>
    implements _$FetchAsistenCopyWith<$Res> {
  __$FetchAsistenCopyWithImpl(this._self, this._then);

  final _FetchAsisten _self;
  final $Res Function(_FetchAsisten) _then;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
  }) {
    return _then(_FetchAsisten(
      null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SelectOrganisasi with DiagnosticableTreeMixin implements FormInputEvent {
  const _SelectOrganisasi(this.id, this.organisasi, this.selectedLabel);

  final String id;
  final String organisasi;
  final String selectedLabel;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectOrganisasiCopyWith<_SelectOrganisasi> get copyWith =>
      __$SelectOrganisasiCopyWithImpl<_SelectOrganisasi>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormInputEvent.selectOrganisasi'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('organisasi', organisasi))
      ..add(DiagnosticsProperty('selectedLabel', selectedLabel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectOrganisasi &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organisasi, organisasi) ||
                other.organisasi == organisasi) &&
            (identical(other.selectedLabel, selectedLabel) ||
                other.selectedLabel == selectedLabel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, organisasi, selectedLabel);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.selectOrganisasi(id: $id, organisasi: $organisasi, selectedLabel: $selectedLabel)';
  }
}

/// @nodoc
abstract mixin class _$SelectOrganisasiCopyWith<$Res>
    implements $FormInputEventCopyWith<$Res> {
  factory _$SelectOrganisasiCopyWith(
          _SelectOrganisasi value, $Res Function(_SelectOrganisasi) _then) =
      __$SelectOrganisasiCopyWithImpl;
  @useResult
  $Res call({String id, String organisasi, String selectedLabel});
}

/// @nodoc
class __$SelectOrganisasiCopyWithImpl<$Res>
    implements _$SelectOrganisasiCopyWith<$Res> {
  __$SelectOrganisasiCopyWithImpl(this._self, this._then);

  final _SelectOrganisasi _self;
  final $Res Function(_SelectOrganisasi) _then;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organisasi = null,
    Object? selectedLabel = null,
  }) {
    return _then(_SelectOrganisasi(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == organisasi
          ? _self.organisasi
          : organisasi // ignore: cast_nullable_to_non_nullable
              as String,
      null == selectedLabel
          ? _self.selectedLabel
          : selectedLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SelectAsisten with DiagnosticableTreeMixin implements FormInputEvent {
  const _SelectAsisten(this.nip, this.nama, this.jabatan, this.selectedLabel);

  final String nip;
  final String nama;
  final String jabatan;
  final String selectedLabel;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectAsistenCopyWith<_SelectAsisten> get copyWith =>
      __$SelectAsistenCopyWithImpl<_SelectAsisten>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormInputEvent.selectAsisten'))
      ..add(DiagnosticsProperty('nip', nip))
      ..add(DiagnosticsProperty('nama', nama))
      ..add(DiagnosticsProperty('jabatan', jabatan))
      ..add(DiagnosticsProperty('selectedLabel', selectedLabel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectAsisten &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.selectedLabel, selectedLabel) ||
                other.selectedLabel == selectedLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nip, nama, jabatan, selectedLabel);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.selectAsisten(nip: $nip, nama: $nama, jabatan: $jabatan, selectedLabel: $selectedLabel)';
  }
}

/// @nodoc
abstract mixin class _$SelectAsistenCopyWith<$Res>
    implements $FormInputEventCopyWith<$Res> {
  factory _$SelectAsistenCopyWith(
          _SelectAsisten value, $Res Function(_SelectAsisten) _then) =
      __$SelectAsistenCopyWithImpl;
  @useResult
  $Res call({String nip, String nama, String jabatan, String selectedLabel});
}

/// @nodoc
class __$SelectAsistenCopyWithImpl<$Res>
    implements _$SelectAsistenCopyWith<$Res> {
  __$SelectAsistenCopyWithImpl(this._self, this._then);

  final _SelectAsisten _self;
  final $Res Function(_SelectAsisten) _then;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? nama = null,
    Object? jabatan = null,
    Object? selectedLabel = null,
  }) {
    return _then(_SelectAsisten(
      null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == nama
          ? _self.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      null == jabatan
          ? _self.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String,
      null == selectedLabel
          ? _self.selectedLabel
          : selectedLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Send with DiagnosticableTreeMixin implements FormInputEvent {
  const _Send(this.surat);

  final FormSuratModel surat;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendCopyWith<_Send> get copyWith =>
      __$SendCopyWithImpl<_Send>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormInputEvent.send'))
      ..add(DiagnosticsProperty('surat', surat));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Send &&
            (identical(other.surat, surat) || other.surat == surat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, surat);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.send(surat: $surat)';
  }
}

/// @nodoc
abstract mixin class _$SendCopyWith<$Res>
    implements $FormInputEventCopyWith<$Res> {
  factory _$SendCopyWith(_Send value, $Res Function(_Send) _then) =
      __$SendCopyWithImpl;
  @useResult
  $Res call({FormSuratModel surat});

  $FormSuratModelCopyWith<$Res> get surat;
}

/// @nodoc
class __$SendCopyWithImpl<$Res> implements _$SendCopyWith<$Res> {
  __$SendCopyWithImpl(this._self, this._then);

  final _Send _self;
  final $Res Function(_Send) _then;

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? surat = null,
  }) {
    return _then(_Send(
      null == surat
          ? _self.surat
          : surat // ignore: cast_nullable_to_non_nullable
              as FormSuratModel,
    ));
  }

  /// Create a copy of FormInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormSuratModelCopyWith<$Res> get surat {
    return $FormSuratModelCopyWith<$Res>(_self.surat, (value) {
      return _then(_self.copyWith(surat: value));
    });
  }
}

/// @nodoc

class _Reset with DiagnosticableTreeMixin implements FormInputEvent {
  const _Reset();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormInputEvent.reset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputEvent.reset()';
  }
}

// dart format on
