part of 'surat_bloc.dart';

@Freezed()
abstract class SuratEvent with _$SuratEvent {
  const factory SuratEvent.initial() = _Initial;
  const factory SuratEvent.fetch() = _Fetch;
}
