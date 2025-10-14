import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_app/features/surat/application/models/detail_surat_model/detail_surat_model.dart';
import 'package:super_app/features/surat/pages/disposisi.dart';
import 'package:super_app/features/surat/pages/tracking_disposisi.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SuratMasukDetail extends StatefulWidget {
  const SuratMasukDetail({
    super.key,
    required this.detailSurat,
    required this.username,
    required this.kodeSurat,
  });

  final DetailSuratModel detailSurat;
  final String username;
  final String kodeSurat;

  @override
  State<SuratMasukDetail> createState() => _SuratMasukDetailState();
}

class _SuratMasukDetailState extends State<SuratMasukDetail> {
  final TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: kDefaultFontSize,
      color: Colors.black,
      shadows: [
        Shadow(color: CupertinoColors.white),
        Shadow(color: CupertinoColors.white),
        Shadow(color: CupertinoColors.white),
        Shadow(color: CupertinoColors.white),
      ]);

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late Color pdfBg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: widget.kodeSurat))
                  .then((value) {
                SnackBar snackBar = SnackBar(
                  content: Text('Kode berhasil disalin: ${widget.kodeSurat}'),
                  backgroundColor: Colors.blue.shade900,
                ); //only if ->
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: const Icon(
              Icons.copy,
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return TrackingDisposisi(
                      disposisi: widget.detailSurat.disposisi,
                    );
                  },
                ),
              );
            },
            child: const Icon(
              CupertinoIcons.list_bullet_below_rectangle,
            ),
          ),
          const SizedBox(width: 24),
          const Icon(CupertinoIcons.ellipsis),
          const SizedBox(width: 24),
        ],
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: widget.detailSurat.perihal,
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.7),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                    ),
                                    child: Text(widget.detailSurat.jenis),
                                  ),
                                ),
                              ],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              text: TextSpan(
                                text: 'Dari : ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(text: widget.detailSurat.pengirim),
                                ],
                              ),
                            ),
                          ),
                          Text(widget.detailSurat.tanggal),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 16.0),
                      child: SfPdfViewerTheme(
                        data: SfPdfViewerThemeData(
                          backgroundColor: pdfBg,
                          progressBarColor: Colors.cyan,
                          scrollStatusStyle: const PdfScrollStatusStyle(
                            backgroundColor: CupertinoColors.white,
                          ),
                          scrollHeadStyle: const PdfScrollHeadStyle(
                            backgroundColor: Colors.cyan,
                            pageNumberTextStyle: TextStyle(
                              color: CupertinoColors.white,
                            ),
                          ),
                          paginationDialogStyle: const PdfPaginationDialogStyle(
                            backgroundColor: CupertinoColors.white,
                          ),
                        ),
                        child: SfPdfViewer.network(
                          widget.detailSurat.path,
                          key: _pdfViewerKey,
                          initialZoomLevel: 0.5,
                          onDocumentLoaded: (val) {
                            setState(() {
                              pdfBg = Colors.black;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Status ${widget.detailSurat.jenis}:',
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(widget.detailSurat.status),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            widget.detailSurat.currentUser == widget.username
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    curve: Curves.linear,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(
                      bottom: 0,
                      left: 32,
                      right: 32,
                    ),
                    margin: const EdgeInsets.only(bottom: 32.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final status = await Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                          return Disposisi(
                            jenis: widget.detailSurat.jenis,
                            id: widget.detailSurat.id,
                            fromNip: widget.username,
                          );
                        }));

                        if (status == true) {
                          context.mounted
                              ? Navigator.of(context).pop(true)
                              : null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: const Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Teruskan',
                          style: TextStyle(
                            color: CupertinoColors.white,
                          ),
                          children: [
                            WidgetSpan(child: SizedBox(width: 8)),
                            WidgetSpan(
                              child: Icon(
                                CupertinoIcons.arrowshape_turn_up_right,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
