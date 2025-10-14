part of 'atasan_bloc.dart';

@freezed
class AtasanEvent with _$AtasanEvent {
  const factory AtasanEvent.fetch() = _Fetch;
  const factory AtasanEvent.select(AtasanModel atasan, List<AtasanModel> listAtasan) = _Select;
}
