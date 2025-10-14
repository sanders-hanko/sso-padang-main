part of 'disposisi_bloc.dart';

@freezed
class DisposisiEvent with _$DisposisiEvent {
  const factory DisposisiEvent.fetch(String id) = _Fetch;
  const factory DisposisiEvent.send(String suratId, String fromNip, String telitiSaran, String toNip) = _Send;
}
