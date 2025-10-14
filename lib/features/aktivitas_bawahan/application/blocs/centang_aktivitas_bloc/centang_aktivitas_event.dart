part of 'centang_aktivitas_bloc.dart';

@freezed
class CentangAktivitasEvent with _$CentangAktivitasEvent {
  const factory CentangAktivitasEvent.started() = _Started;
  const factory CentangAktivitasEvent.selesai() = _Selesai;
  const factory CentangAktivitasEvent.select(String nip, int id) = _Select;
  const factory CentangAktivitasEvent.sending(String nip, List<String?> id, String statusAktivitas) = _Sending;

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
