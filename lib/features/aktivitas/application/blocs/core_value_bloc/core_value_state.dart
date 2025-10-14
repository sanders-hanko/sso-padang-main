import 'package:super_app/features/aktivitas/application/models/core_value_model/core_value_model.dart';

class CoreValueState {}

class Initial extends CoreValueState {}

class Loading extends CoreValueState {}

class Loaded extends CoreValueState {
  final List<CoreValueModel> coreValue;
  Loaded(this.coreValue);
}

class Selected extends CoreValueState {
  final CoreValueModel coreValue;
  final List<CoreValueModel> listCoreValue;
  Selected(this.coreValue, this.listCoreValue);
}

class Error extends CoreValueState {
  final String message;
  Error(this.message);
}
