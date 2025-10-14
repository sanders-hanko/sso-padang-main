import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';
import 'package:super_app/features/surat/pages/surat_masuk_detail.dart';

import '../../application/blocs/surat_bloc/surat_bloc.dart';

class PageList extends StatelessWidget {
  const PageList({
    super.key,
    required this.surat,
    required this.disposisiAccess,
    required this.username,
    required this.context,
  });

  final ListSuratModel surat;
  final bool disposisiAccess;
  final String username;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      onTap: () async {
        // final status = await
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
              return SuratMasukDetail(
                detailSurat: surat.detail,
                username: username,
                kodeSurat: surat.kodeSurat,
              );
            },
          ),
        );

        // if (status == true) {
        //   context.mounted
        //       ? context.read<SuratBloc>().add(const SuratEvent.fetch())
        //       : null;
        // }
      },
      backgroundColor:
          disposisiAccess && surat.currentUser.toString() == username.toString()
              ? Colors.black12
              : CupertinoColors.white,
      leading:
          disposisiAccess && surat.currentUser.toString() == username.toString()
              ? SvgPicture.asset('assets/svg_image/email.svg')
              : SvgPicture.asset('assets/svg_image/email-open.svg'),
      title: SizedBox(
        width: double.infinity,
        child: Text(surat.pengirim),
      ),
      subtitle: Text(surat.disposisi),
      trailing: Text(
        "${surat.tanggal}\n${surat.jam}",
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
