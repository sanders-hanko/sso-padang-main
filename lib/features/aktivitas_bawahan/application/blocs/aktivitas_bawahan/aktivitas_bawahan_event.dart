part of 'aktivitas_bawahan_bloc.dart';

@freezed
class AktivitasBawahanEvent with _$AktivitasBawahanEvent {
  const factory AktivitasBawahanEvent.initial() = _Initial;
  const factory AktivitasBawahanEvent.fetch(BuildContext context) = _Fetch;
}
