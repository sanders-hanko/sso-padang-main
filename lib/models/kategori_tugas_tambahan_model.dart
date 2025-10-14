class KategoriTugasTambahanModel {
  final int id;
  final String namaKategori;

  KategoriTugasTambahanModel({
    required this.id,
    required this.namaKategori,
  });

  factory KategoriTugasTambahanModel.fromJson(Map<String, dynamic> json) {

    return KategoriTugasTambahanModel(
      id: json['id'],
      namaKategori: json['nama_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namaKategori': namaKategori,
    };
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
