// import 'package:flutter_native_splash/cli_commands.dart';

class User {
  final String id;
  final String nip;
  final String nik;
  final String nama;
  final String alamat;
  final String tempatLahir;
  final String tanggalLahir;
  final String noHp;
  final String jenisJabatanId;
  final String jabatanId;
  final String jabatan;
  final String jenisKelamin;
  final String unorId;
  final String unorIndukId;

  User({
    required this.id,
    required this.nip,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.noHp,
    required this.jenisJabatanId,
    required this.jabatanId,
    required this.jabatan,
    required this.jenisKelamin,
    required this.unorId,
    required this.unorIndukId,
  });

  factory User.fromJson(Map<String, String> json) {
    return User(
      id: json['PNS_ID'] ?? '',
      nip: json['NIP_BARU'] ?? '',
      nik: json['NIK'] ?? '',
      nama: json['NAMA'] ?? '',
      alamat: json['ALAMAT'] ?? '',
      tempatLahir: json['TEMPAT_LAHIR'] ?? '',
      tanggalLahir: json['TANGGAL_LAHIR'] ?? '',
      noHp: json['NO_HP'] ?? '',
      jenisJabatanId: json['JENIS_JABATAN_ID'] ?? '',
      jabatanId: json['JABATAN_ID'] ?? '',
      jabatan: json['JABATAN_NAMA'] ?? '',
      jenisKelamin: json['JENIS_KELAMIN'] ?? '',
      unorId: json['UNOR_ID'] ?? '',
      unorIndukId: json['UNOR_INDUK_ID'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'nip': nip,
      'nik': nik,
      'nama': nama.split(' ').map((word) => word.capitalize()).join(' '),
      'alamat': alamat,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tanggalLahir,
      'noHp': noHp,
      'jenisJabatanId': jenisJabatanId,
      'jabatanId': jabatanId,
      'jabatan': jabatan.split(' ').map((word) => word.capitalize()).join(' '),
      'jenisKelamin': jenisKelamin,
      'unorId': unorId,
      'unorIndukId': unorIndukId,
    };
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
