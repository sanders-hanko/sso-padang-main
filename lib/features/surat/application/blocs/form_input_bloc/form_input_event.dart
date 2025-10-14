part of 'form_input_bloc.dart';

@freezed
class FormInputEvent with _$FormInputEvent {
  const factory FormInputEvent.fetchOrganisasi(String label) = _FetchOrganisasi;
  const factory FormInputEvent.fetchAsisten(String label) = _FetchAsisten;
  const factory FormInputEvent.selectOrganisasi(String id, String organisasi, String selectedLabel) = _SelectOrganisasi;
  const factory FormInputEvent.selectAsisten(String nip, String nama, String jabatan, String selectedLabel) = _SelectAsisten;
  const factory FormInputEvent.send(FormSuratModel surat) = _Send;
  const factory FormInputEvent.reset() = _Reset;

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug, int wrapWidth = 65}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }

  @override
  String toStringShort() {
    // TODO: implement toStringShort
    throw UnimplementedError();
  }
}
