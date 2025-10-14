class DisposisiState {}

class Initial extends DisposisiState {}

class Loading extends DisposisiState {}

class Loaded extends DisposisiState {
  final Map<String, dynamic> data;
  Loaded(this.data);
}

class Sending extends DisposisiState {}

class Sent extends DisposisiState {}

class SendError extends DisposisiState {
  final String message;
  SendError(this.message);
}

class Error extends DisposisiState {
  final String message;
  Error(this.message);
}
