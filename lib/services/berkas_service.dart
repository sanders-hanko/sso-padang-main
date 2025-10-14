import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:super_app/Utils/utils.dart';

class BerkasService {
  late List listLayanan = [];

  late List berkasLayanan = [];

  late List draftBerkas = [];

  late List listTrans = [];

  late bool aksesVerifikator = false;

  late bool statusUpdate = false;

  late Map<String, dynamic> periodeLayanan = {};

  late Map<String, dynamic> draftLayanan = {};

  Future<List> getJenisLayanan(String kodeLayanan) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = '${utility.getJenisLayanan}$kodeLayanan';

    final url = Uri.https(authority, unencodedPath);

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(url);

        print(response.statusCode);

        print(response.body);
      }

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        listLayanan = jsonDecode(response.body)['data'];
      }

      await Future.delayed(const Duration(seconds: 2));

      return listLayanan;
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }
  }

  Future<Map<String, dynamic>> cekPeriodeLayanan(String kodeLayanan) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = '${utility.cekPeriodeLayanan}$kodeLayanan';

    final url = Uri.https(authority, unencodedPath);

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(url);

        print(response.statusCode);
      }

      periodeLayanan = jsonDecode(response.body);

      await Future.delayed(const Duration(seconds: 3));

      return periodeLayanan;
    } on TimeoutException catch (e) {
      return {'timeout': e};
    }
  }

  Future<List> getBerkasLayanan(String idLayanan) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = '${utility.getBerkasLayanan}$idLayanan';

    final url = Uri.https(authority, unencodedPath);

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(url);

        print(response.statusCode);

        print(response.body);
      }

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        berkasLayanan = jsonDecode(response.body)['data'];
      }

      await Future.delayed(const Duration(seconds: 2));

      return berkasLayanan;
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }
  }

  Future<Map<String, dynamic>> getDraft(nip, idJenisLayanan) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = '${utility.getDraft}$nip/$idJenisLayanan';

    final url = Uri.https(authority, unencodedPath);

    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(url);

        print(response.statusCode);
      }

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        draftLayanan = jsonDecode(response.body)['data'];
        if (kDebugMode) {
          print('response data: ${jsonDecode(response.body)['data']}');
        }
      }

      return draftLayanan;
    } on TimeoutException catch (e) {
      return {'timeout': e};
    }
  }

  Future<bool> hapusDraft(String idDraft) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = '${utility.hapusDraftBerkas}$idDraft';

    final url = Uri.https(authority, unencodedPath);

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(url);

        print(response.statusCode);
      }

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        return true;
      }

      return false;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<List> doUpload(
      nip, index, file, draftCode, idBerkas, idJenisLayanan) async {
    draftBerkas.clear();

    if (kDebugMode) {
      print('id berkas: $idBerkas');
    }

    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = utility.postDraftBerkas;

    final url = Uri.https(authority, unencodedPath);

    final request = http.MultipartRequest('POST', url);

    request.files
        .add(await http.MultipartFile.fromPath('berkas', file.paths[0]));

    request.fields.addAll({
      'nip': nip,
      'kode_draft': draftCode,
      'id_berkas': idBerkas.toString(),
      'id_jenis_layanan': idJenisLayanan.toString(),
    });

    final response = await request.send().timeout(
      const Duration(seconds: 180),
      onTimeout: () {
        return timeOutResponse(
          httpMethod: 'MULTIPART POST',
          error: 'Request Time Out',
          url: url.toString(),
        );
      },
    );

    var responseBytes = await response.stream.toBytes();
    var responseString = utf8.decode(responseBytes);

    if (kDebugMode) {
      print(url);
      print(response.statusCode);
      print(jsonDecode(responseString));
    }

    if (response.statusCode == 200) {
      draftBerkas = [jsonDecode(responseString)];
    }

    return draftBerkas;
  }

  Future<bool> kirimLayanan(nip, draftCode, level) async {
    final Utils utility = Utils();

    final authority = utility.simpegDomain;

    final unencodedPath = utility.postKirimLayanan;

    final url = Uri.https(authority, unencodedPath);

    try {
      final response = await http.post(url, body: {
        'nip': nip,
        'kode_draft': draftCode,
        'level': level.toString(),
      }).timeout(const Duration(seconds: 30));

      if (kDebugMode) {
        print(url);
        print(response.statusCode);
        print(jsonDecode(response.body));
      }

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<List> getListTrans(
      String kodeLayanan, String nip, String status) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postListTrans;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(
      url,
      body: {
        'nip': nip,
        'kode_layanan': kodeLayanan,
        'status': status,
      },
    );

    if (kDebugMode) {
      print(url);
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      listTrans = jsonDecode(response.body)['data'];
    }

    await Future.delayed(const Duration(seconds: 2));

    return listTrans;
  }

  Future<List> getListTransVerifikator(
      String kodeLayanan, String nip, String status) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postListProses;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'nip': nip,
      'kode_layanan': kodeLayanan,
      'status': status,
    });

    if (kDebugMode) {
      print(url);
    }

    if (response.statusCode == 200) {
      listTrans = jsonDecode(response.body)['data'];
    }

    await Future.delayed(const Duration(seconds: 2));

    return listTrans;
  }

  Future<List> getListDetailVerifikator(String idProses) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postDetailProses;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'id_proses': idProses,
    });

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      listTrans = jsonDecode(response.body)['data'];
    }

    return listTrans;
  }

  Future<List> getListDetailLayanan(String idTransLayanan) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postDetailLayanan;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'id_trans_layanan': idTransLayanan,
    });

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      listTrans = jsonDecode(response.body)['data'];
    }

    return listTrans;
  }

  Future<bool> cekAksesVerifikator(String nip, String kodeLayanan) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postCekAkses;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(
      url,
      body: {
        'nip': nip,
        'kode_layanan': kodeLayanan,
      },
    );

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success']) {
        aksesVerifikator = true;
      }
    }

    return aksesVerifikator;
  }

  Future<bool> updateProses(
    String id,
    String nip,
    String status,
    String idJenisLayanan,
    String disposisi,
  ) async {
    final Utils utility = Utils();

    final String authority = utility.simpegDomain;

    final String unencodedPath = utility.postUpdateProses;

    final url = Uri.https(authority, unencodedPath);

    if (kDebugMode) {
      print(id);
      print(disposisi);
      print(idJenisLayanan);
    }

    final response = await http.post(
      url,
      body: {
        'id': id,
        'nip': nip,
        'status': status,
        'id_jenis_layanan': idJenisLayanan,
        'disposisi': disposisi,
      },
    );

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200 && jsonDecode(response.body)['success']) {
      statusUpdate = true;
    }

    return statusUpdate;
  }

  StreamedResponse timeOutResponse({
    required String httpMethod,
    required dynamic error,
    required String url,
  }) {
    Map<String, dynamic> body = {};

    int statusCode = 404;
    Uri destination = Uri.parse(url);
    String json = jsonEncode(body);

    return StreamedResponse(
      Stream.value(json.codeUnits),
      statusCode,
      request: Request(httpMethod, destination),
    );
  }
}
