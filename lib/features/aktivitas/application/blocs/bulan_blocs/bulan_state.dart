class BulanState {}

class Initial extends BulanState {}

class Selected extends BulanState {
  final String bulan;
  final String namaBulan;
  final String tahun;
  Selected(this.bulan, this.namaBulan, this.tahun);
}

class Error extends BulanState {
  final String message;
  Error(this.message);
}
