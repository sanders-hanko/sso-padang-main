import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:super_app/Utils/utils.dart';

class BeritaService {
  final Utils utility = Utils();
  late String authority;
  late String unencodedPath;
  late Uri url;
  late Response response;
  late List listBerita;

  Future<List> getLListBerita(
    bool doFilter,
    String search,
    bool stateReady,
  ) async {
    if (stateReady) {
      authority = utility.simpegDomain;

      unencodedPath = utility.getListBerita;

      if(doFilter) {
        url = Uri.https(authority, unencodedPath, {'search': search});
      }else{
        url = Uri.https(authority, unencodedPath);
      }

      response = await http.get(url);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        listBerita = data['data'];
      }
    }

    return listBerita;
  }
}
