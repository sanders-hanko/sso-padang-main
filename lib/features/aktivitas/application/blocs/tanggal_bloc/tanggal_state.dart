class TanggalState {}

class Initial extends TanggalState {}

class TanggalDefault extends TanggalState {
  final String tahun;
  final String bulan;
  final String namaBulan;
  final String? tanggal;
  final List<int> listTanggal;
  TanggalDefault(
    this.tahun,
    this.bulan,
    this.namaBulan,
    this.tanggal,
    this.listTanggal,
  );
}

class Selected extends TanggalState {
  final String tahun;
  final String bulan;
  final String namaBulan;
  final String? tanggal;
  final List<int> listTanggal;
  Selected(
    this.tahun,
    this.bulan,
    this.namaBulan,
    this.tanggal,
    this.listTanggal,
  );
}

class Error extends TanggalState {
  final String message;
  Error(this.message);
}
