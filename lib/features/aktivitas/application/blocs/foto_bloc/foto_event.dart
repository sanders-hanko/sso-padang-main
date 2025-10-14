part of 'foto_bloc.dart';

@freezed
class FotoEvent with _$FotoEvent {
  const factory FotoEvent.initial() = _Initial;
  const factory FotoEvent.pickFoto(bool bypassPermission, BuildContext context) = _PickFoto;
}
