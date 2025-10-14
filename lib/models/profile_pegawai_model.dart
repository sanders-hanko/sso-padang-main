class ProfilePegawai {
  final String pnsId;
  final String nipBaru;
  final String nik;
  final String nama;
  final String alamat;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenisKelamin;
  final String hp;
  final String jabatanNama;
  final String golNama;
  final String jenisJabatan;
  final String eselon;
  final String tmtJabatan;
  final String tmtGolongan;
  final String unorId;
  final String unorNama;
  final String unorIndukId;
  final String unorIndukNama;

  ProfilePegawai({
    required this.pnsId,
    required this.nipBaru,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.hp,
    required this.jabatanNama,
    required this.golNama,
    required this.jenisJabatan,
    required this.eselon,
    required this.tmtJabatan,
    required this.tmtGolongan,
    required this.unorId,
    required this.unorNama,
    required this.unorIndukId,
    required this.unorIndukNama,
  });

  Map<String, dynamic> toJson() {
    return {
      'pnsId': pnsId,
      'nipBaru': nipBaru,
      'nik': nik,
      'nama': nama,
      'alamat': alamat,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'hp': hp,
      'jabatanNama': jabatanNama,
      'golNama': golNama,
      'jenisJabatan': jenisJabatan,
      'eselon': eselon,
      'tmtJabatan': tmtJabatan,
      'tmtGolongan': tmtGolongan,
      'unorId': unorId,
      'unorNama': unorNama,
      'unorIndukId': unorIndukId,
      'unorIndukNama': unorIndukNama,
    };
  }

  factory ProfilePegawai.fromJson(Map<String, dynamic> json) {
    return ProfilePegawai(
      pnsId: json['PNS_ID'] ?? 0,
      nipBaru: json['NIP_BARU'] ?? '',
      nik: json['NIK'] ?? '',
      nama: json['NAMA'] ?? '',
      alamat: json['ALAMAT'] ?? '',
      tempatLahir: json['TEMPAT_LAHIR'] ?? '',
      tanggalLahir: json['TANGGAL_LAHIR'] ?? '',
      jenisKelamin: json['JENIS_KELAMIN'] ?? '',
      hp: json['NO_HP'] ?? '',
      jabatanNama: json['JABATAN_NAMA'] ?? '',
      golNama: json['GOL_NAMA'] ?? '',
      jenisJabatan: json['JENIS_JABATAN_NAMA'] ?? '',
      eselon: json['ESELON'] ?? '',
      tmtJabatan: json['TMT_JABATAN'] ?? '',
      tmtGolongan: json['TMT_GOLONGAN'] ?? '',
      unorId: json['UNOR_ID'] ?? '',
      unorNama: json['UNOR_NAMA'] ?? '',
      unorIndukId: json['UNOR_INDUK_ID'] ?? '',
      unorIndukNama: json['UNOR_INDUK_NAMA'] ?? '',
    );
  }
}
