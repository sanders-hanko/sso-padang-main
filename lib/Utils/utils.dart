class Utils {
  final String protokolHttps = 'https://';
  final String protokolHttp = 'http://';
  final String secretKey =
      'hmaoFUgrn/x+RqFsoyNnD7hgFpxzKamu9A6534nlrUU4rfrvqKGvigHShj5nYEGfeUGRjOv/OQIuuiPO7qXwJA=='; //Secret Key
  final String applicationCode = 'PDG2024SSO'; //kode aplikasi mobile sso
  final String kodeLayananSibangkom = 'PG-SBK13-71'; //kode layanan sibangkom
  final String namaLayananSibangkom = 'SIBANGKOM'; //nama layanan sibangkom
  final String deskripsiLayananSibangkom =
      'Sistem Informasi Pengembangan Kompetensi Bagi ASN.'; //deskripsi layanan sibangkom
  final String kodeLayananPangkat = 'PG-PKT13-71'; //kode layanan e-Pangkat
  final String namaLayananPangkat = 'e-Pangkat'; //nama layanan e-Pangkat
  final String deskripsiLayananPangkat =
      'Proses pengajuan kenaikan pangkat secara elektronik.'; //deskripsi layanan e-Pangkat
  final String kodeLayananMutasi = 'PG-MTS13-71'; //kode layanan e-Pangkat
  final String namaLayananMutasi = 'e-Mutasi'; //nama layanan e-Pangkat
  final String deskripsiLayananMutasi =
      'Proses pengajuan mutasi secara elektronik.'; //deskripsi layanan e-Pangkat
  final String presensiDomain = 'presensi.padang.go.id'; //models web presensi
  final String simpegDomain = 'simpeg.padang.go.id'; //models web simpeg
  final String cctvDomain = 'https://streamcctv.padang.go.id'; //domain akses cctv
  final String presensiIP = '103.141.75.108:4000'; //IP web presensi
  final String simpegIP = '103.141.75.108:3000'; //IP web simpeg
  final String tppDomain = 'etpp.padang.go.id'; //models web tpp
  final String getJenisIzin = '/api/get-jenis-izin'; //jenis izin
  final String getJenisIzinTlCp =
      '/api/get-jenis-izin-tl-cp'; //jenis izin tpp perwako 2024 pasal 19 ayat 2
  final String getJenisCuti = '/api/get-data-jenis-cuti'; //jenis cuti
  final String getIzin = '/api/get-izin'; //list izin pegawai
  final String getCuti = '/api/get-cuti'; //list cuti pegawai
  final String getTpp = '/api/v1/tpp-pegawai'; //data tpp pegawai
  final String storeIzinPegawai =
      '/api/store-izin-pegawai'; //post pengajuan izin baru
  final String storeIzinAbsensi =
      '/api/store-izin-absensi'; //post pengajuan izin absensi baru
  final String getIzinAbsensiBawahan =
      '/api/izin-absensi-bawahan'; //get list izin absensi bawahan(telat dan cp)
  final String getAbsenLuarKantorBawahan =
      '/api/absen-luar-kantor-bawahan'; //get absensi luar kantor bawahan
  final String updateIzinAbsensiBawahan =
      '/api/update-absensi-bawahan'; //update pengajuan izin absensi baru
  final String updateAbsenLuarKantor =
      '/api/update-absen-luar-kantor'; //update pengajuan izin absensi baru
  final String storeIzinTlCp =
      '/api/store-izin-tl-cp'; //post pengajuan izin terlambat/cepat pulang
  final String storeCutiPegawai =
      '/api/store-cuti-pegawai'; //post pengajuan cuti baru
  final String postAbsensiPath = '/api/absensi'; //post data absen
  final String dataRiwayat = '/api/data-riwayat'; //riwayat absensi pegawai
  final String profilePegawaiPath = '/api/v1/profile-asn/'; //profil pegawai
  final String getJumlahCutiPegawai =
      '/api/get-jumlah-cuti-pegawai'; //jumlah cuti pegawai dalam bentuk integer
  final String getJumlahIzinPegawai =
      '/api/get-jumlah-izin-pegawai'; //jumlah izin pegawai dalam bentuk integer
  final String getListIzinPegawai =
      '/api/get-list-izin-pegawai'; //list izin bawahan
  final String getListCutiPegawai =
      '/api/get-list-cuti-pegawai'; //list cuti bawahan
  final String updateIzinPegawai =
      '/api/update-izin-pegawai'; //update izin status bawahan
  final String updateCutiPegawai =
      '/api/update-cuti-pegawai'; //update cuti status bawahan
  final String updatePassword = '/api/v1/update-password'; //update password
  final String getAccessRights = '/api/v1/get-access-rights/'; //hak akses
  final String getPermission = '/api/v1/permission/get'; //hak akses versi 2
  final List<String> listAccessCode = [
    'input_surat',
    'disposisi_surat',
  ];
  final String inputSuratAccessCode = 'input_surat';
  final String disposisiSuratAccessCode = 'disposisi_surat';
  final String createAktivitasAccessCode = 'create_aktivitas';
  final String accAktivitasAccessCode = 'acc_aktivitas';
  final String bypassAktivitasAccessCode = 'bypass_aktivitas';
  final String privacyPolicy =
      '/sso-asn-padang-privacy-policy'; //privacy policy presensi
  final String getStruktural =
      '/get-struktural/'; //data struktural di organisasi pegawai yang login
  final String cekHukdis =
      '/api/v1/cek-hukdis/'; //data struktural di organisasi pegawai yang login
  final String getJenisLayanan =
      '/api/v1/layanan/jenis-layanan/'; //jenis layanan kepegawaian
  final String getBerkasLayanan =
      '/api/v1/layanan/berkas-layanan/'; //berkas layanan kepegawaian
  final String cekPeriodeLayanan =
      '/api/v1/layanan/periode-layanan/'; //periode layanan kepegawaian
  final String postDraftBerkas =
      '/api/v1/layanan/simpan-draft-berkas'; //post draft berkas layanan kepegawaian
  final String postKirimLayanan =
      '/api/v1/layanan/kirim-layanan'; //post draft berkas layanan kepegawaian
  final String postListTrans =
      '/api/v1/layanan/list-trans'; //post list transaksi layanan kepegawaian
  final String postListProses =
      '/api/v1/layanan/list-proses'; //post list transaksi layanan kepegawaian
  final String postDetailProses =
      '/api/v1/layanan/detail-proses'; //post list transaksi layanan kepegawaian
  final String postDetailLayanan =
      '/api/v1/layanan/detail-trans'; //post list transaksi layanan kepegawaian
  final String hapusDraftBerkas =
      '/api/v1/layanan/hapus-berkas/'; //post draft berkas layanan kepegawaian
  final String getDraft =
      '/api/v1/layanan/draft-layanan/'; //draft layanan kepegawaian
  final String postCekAkses =
      '/api/v1/layanan/cek-akses'; //draft layanan kepegawaian
  final String postUpdateProses =
      '/api/v1/layanan/update-proses'; //draft layanan kepegawaian
  final String verifyToken =
      '/api/v1/verify-token/'; //draft layanan kepegawaian
  final String refreshToken =
      '/api/v1/refresh-token/'; //draft layanan kepegawaian
  final String getListBerita =
      '/api/v1/get-list-berita'; //draft layanan kepegawaian
  final String getMasterOrganisasi =
      '/api/v1/master-organisasi'; //data master organisasi
  final String getDataAsisten = '/api/v1/data-asisten'; //data asisten
  final String fotoIzinAbsensi =
      '/foto-izin-absensi/'; //foto izin telat / cepat pulang
  final String fotoAbsenLuarKantor =
      '/foto-absen-luar-kantor/'; //foto absensi diluar kantor
  final String appPackage = '/app-package'; //list package app yang diblock

  // aktivitas harian url
  final String storeAktivitasPegawai =
      '/api/aktivitas-harian/pegawai/store'; //store aktivitas harian pegawai
  final String nilaiAktivitasPegawai =
      '/api/aktivitas-harian/pegawai/nilai'; //nilai aktivitas harian pegawai
  final String getAktivitasPegawai =
      '/api/aktivitas-harian/pegawai/get'; //get aktivitas harian pegawai
  final String storeAktivitasAtasan =
      '/api/aktivitas-harian/atasan/store'; //store aktivitas harian atasan
  final String getAktivitasAtasan =
      '/api/aktivitas-harian/atasan/get'; //get aktivitas harian atasan
  final String fotoAktivitasPegawai =
      '/storage/'; //foto aktivitas harian pegawai
  final String coreValue = '/api/aktivitas-harian/pegawai/core-value'; //get data core value
  final String getKegiatan = '/api/aktivitas-harian/pegawai/kegiatan/';
  // end aktivitas url

  // app slide url
  final String getSlide1 = '/slide/1'; //slide 1
  final String getSlide2 = '/slide/2'; //slide 2
  final String getSlide3 = '/slide/3'; //slide 3
  final String getSlide4 = '/slide/4'; //slide 4
  final String getSlide5 = '/slide/5'; //slide 5
  // end app slide url

  //surat masuk url
  final String getSurat = '/api/v1/surat/list'; //get list surat masuk
  final String postSurat = '/api/v1/surat/store'; //simpan surat masuk baru
  final String disposisiBerikutnya = '/api/v1/surat/disposisi/berikutnya/'; //simpan surat masuk baru
  final String disposisiStore = '/api/v1/surat/disposisi/store'; //simpan disposisi surat masuk baru
  final String getDetailSurat =
      '/api/v1/surat/detail/'; //get detail surat masuk
  final String postDisposisiSurat =
      '/api/v1/surat/disposisi/store'; //simpan disposisi surat
  //end surat masuk url

  late String tanggal;

  final List<String> authPath = [
    '/api/v1/login',
    '/api/v1/logout',
    '/api/v1/refresh-token',
    '/api/aktivitas-harian/pegawai/get',
  ];

  final String clientId = '12';
  final String clientSecret = 'QHOgKuDpu8xF0sWTwNjyApImAdcZ6Om9BmbdZnOt';

  String tanggalHariIni() {
    String hari = "${DateTime.now().day}";
    String bulan = namaBulan(DateTime.now().month);
    String tahun = "${DateTime.now().year}";

    return "$hari $bulan $tahun";
  }

  String formatIndonesia(String tanggal) {
    int tahun = DateTime.parse(tanggal).year;
    int bulan = DateTime.parse(tanggal).month;
    int hari = DateTime.parse(tanggal).day;
    return '$hari ${namaBulan(bulan)} $tahun';
  }

  String namaBulan(int intBulan) {
    late String bulan;

    switch (intBulan) {
      case 1:
        bulan = "Januari";
        break;
      case 2:
        bulan = "Februari";
        break;
      case 3:
        bulan = "Maret";
        break;
      case 4:
        bulan = "April";
        break;
      case 5:
        bulan = "Mei";
        break;
      case 6:
        bulan = "Juni";
        break;
      case 7:
        bulan = "Juli";
        break;
      case 8:
        bulan = "Agustus";
        break;
      case 9:
        bulan = "September";
        break;
      case 10:
        bulan = "Oktober";
        break;
      case 11:
        bulan = "November";
        break;
      case 12:
        bulan = "Desember";
        break;
      default:
        bulan = "Januari";
        break;
    }

    return bulan;
  }
}
