import 'package:super_app/features/aktivitas_bawahan/application/models/bulan_model/bulan_model.dart';

class BulanState {}

class Initial extends BulanState {}

class Selected extends BulanState {
  final BulanModel bulan;
  Selected(this.bulan);
}

class Error extends BulanState {
  final String message;
  Error(this.message);
}
