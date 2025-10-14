class NonAsn {
  final String id;
  final String username;
  final String nama;
  final String jabatanId;
  final String jabatan;
  final String jenisKelamin;

  NonAsn({
    required this.id,
    required this.username,
    required this.nama,
    required this.jabatanId,
    required this.jabatan,
    required this.jenisKelamin,
  });

  factory NonAsn.fromJson(Map<String, String> json) {
    return NonAsn(
      id: json['ID'] ?? '',
      username: json['USERNAME'] ?? '',
      nama: json['NAMA'] ?? '',
      jabatanId: json['JABATAN_ID'] ?? '',
      jabatan: json['JABATAN_NAMA'] ?? '',
      jenisKelamin: json['JENIS_KELAMIN'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'username': username,
      'nama': nama.split(' ').map((word) => word.capitalize()).join(' '),
      'jabatanId': jabatanId,
      'jabatan': jabatan.split(' ').map((word) => word.capitalize()).join(' '),
      'jenisKelamin': jenisKelamin,
    };
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
