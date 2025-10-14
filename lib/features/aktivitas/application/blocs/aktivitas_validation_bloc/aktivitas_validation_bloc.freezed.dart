// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aktivitas_validation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AktivitasValidationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AktivitasValidationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AktivitasValidationEvent()';
  }
}

/// @nodoc
class $AktivitasValidationEventCopyWith<$Res> {
  $AktivitasValidationEventCopyWith(
      AktivitasValidationEvent _, $Res Function(AktivitasValidationEvent) __);
}

/// @nodoc

class _Validate implements AktivitasValidationEvent {
  const _Validate(
      this.nipController,
      this.atasanController,
      this.tanggalController,
      this.coreValueController,
      this.kegiatanController,
      this.fotoController,
      this.fileNameController,
      this.keteranganController);

  final TextEditingController nipController;
  final TextEditingController atasanController;
  final TextEditingController tanggalController;
  final TextEditingController coreValueController;
  final TextEditingController kegiatanController;
  final TextEditingController fotoController;
  final TextEditingController fileNameController;
  final TextEditingController keteranganController;

  /// Create a copy of AktivitasValidationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValidateCopyWith<_Validate> get copyWith =>
      __$ValidateCopyWithImpl<_Validate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Validate &&
            (identical(other.nipController, nipController) ||
                other.nipController == nipController) &&
            (identical(other.atasanController, atasanController) ||
                other.atasanController == atasanController) &&
            (identical(other.tanggalController, tanggalController) ||
                other.tanggalController == tanggalController) &&
            (identical(other.coreValueController, coreValueController) ||
                other.coreValueController == coreValueController) &&
            (identical(other.kegiatanController, kegiatanController) ||
                other.kegiatanController == kegiatanController) &&
            (identical(other.fotoController, fotoController) ||
                other.fotoController == fotoController) &&
            (identical(other.fileNameController, fileNameController) ||
                other.fileNameController == fileNameController) &&
            (identical(other.keteranganController, keteranganController) ||
                other.keteranganController == keteranganController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nipController,
      atasanController,
      tanggalController,
      coreValueController,
      kegiatanController,
      fotoController,
      fileNameController,
      keteranganController);

  @override
  String toString() {
    return 'AktivitasValidationEvent.validate(nipController: $nipController, atasanController: $atasanController, tanggalController: $tanggalController, coreValueController: $coreValueController, kegiatanController: $kegiatanController, fotoController: $fotoController, fileNameController: $fileNameController, keteranganController: $keteranganController)';
  }
}

/// @nodoc
abstract mixin class _$ValidateCopyWith<$Res>
    implements $AktivitasValidationEventCopyWith<$Res> {
  factory _$ValidateCopyWith(_Validate value, $Res Function(_Validate) _then) =
      __$ValidateCopyWithImpl;
  @useResult
  $Res call(
      {TextEditingController nipController,
      TextEditingController atasanController,
      TextEditingController tanggalController,
      TextEditingController coreValueController,
      TextEditingController kegiatanController,
      TextEditingController fotoController,
      TextEditingController fileNameController,
      TextEditingController keteranganController});
}

/// @nodoc
class __$ValidateCopyWithImpl<$Res> implements _$ValidateCopyWith<$Res> {
  __$ValidateCopyWithImpl(this._self, this._then);

  final _Validate _self;
  final $Res Function(_Validate) _then;

  /// Create a copy of AktivitasValidationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nipController = null,
    Object? atasanController = null,
    Object? tanggalController = null,
    Object? coreValueController = null,
    Object? kegiatanController = null,
    Object? fotoController = null,
    Object? fileNameController = null,
    Object? keteranganController = null,
  }) {
    return _then(_Validate(
      null == nipController
          ? _self.nipController
          : nipController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == atasanController
          ? _self.atasanController
          : atasanController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == tanggalController
          ? _self.tanggalController
          : tanggalController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == coreValueController
          ? _self.coreValueController
          : coreValueController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == kegiatanController
          ? _self.kegiatanController
          : kegiatanController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == fotoController
          ? _self.fotoController
          : fotoController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == fileNameController
          ? _self.fileNameController
          : fileNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == keteranganController
          ? _self.keteranganController
          : keteranganController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _Send implements AktivitasValidationEvent {
  const _Send(this.aktivitas);

  final AktivitasModel aktivitas;

  /// Create a copy of AktivitasValidationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendCopyWith<_Send> get copyWith =>
      __$SendCopyWithImpl<_Send>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Send &&
            (identical(other.aktivitas, aktivitas) ||
                other.aktivitas == aktivitas));
  }

  @override
  int get hashCode => Object.hash(runtimeType, aktivitas);

  @override
  String toString() {
    return 'AktivitasValidationEvent.send(aktivitas: $aktivitas)';
  }
}

/// @nodoc
abstract mixin class _$SendCopyWith<$Res>
    implements $AktivitasValidationEventCopyWith<$Res> {
  factory _$SendCopyWith(_Send value, $Res Function(_Send) _then) =
      __$SendCopyWithImpl;
  @useResult
  $Res call({AktivitasModel aktivitas});

  $AktivitasModelCopyWith<$Res> get aktivitas;
}

/// @nodoc
class __$SendCopyWithImpl<$Res> implements _$SendCopyWith<$Res> {
  __$SendCopyWithImpl(this._self, this._then);

  final _Send _self;
  final $Res Function(_Send) _then;

  /// Create a copy of AktivitasValidationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aktivitas = null,
  }) {
    return _then(_Send(
      null == aktivitas
          ? _self.aktivitas
          : aktivitas // ignore: cast_nullable_to_non_nullable
              as AktivitasModel,
    ));
  }

  /// Create a copy of AktivitasValidationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AktivitasModelCopyWith<$Res> get aktivitas {
    return $AktivitasModelCopyWith<$Res>(_self.aktivitas, (value) {
      return _then(_self.copyWith(aktivitas: value));
    });
  }
}

// dart format on
