import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackingDisposisi extends StatelessWidget {
  const TrackingDisposisi({super.key, required this.disposisi});

  final List<dynamic>? disposisi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close),
        ),
        title: const Text('Tracking Disposisi'),
        backgroundColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: const Text(
                  'Tracking disposisi menampilkan data disposisi surat.'),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connectedFromStyle(
                  contentsAlign: ContentsAlign.basic,
                  nodePositionBuilder: (context, index) {
                    return 0.28;
                  },
                  firstConnectorStyle: ConnectorStyle.transparent,
                  lastConnectorStyle: disposisi!.length == 1 ? ConnectorStyle.solidLine : ConnectorStyle.transparent,
                  indicatorStyleBuilder: (context, index) {
                    return index == 0
                        ? IndicatorStyle.dot
                        : IndicatorStyle.outlined;
                  },
                  oppositeContentsBuilder: (context, index) {
                    final String text = disposisi!.length == 1
                        ? '${disposisi?[index]['tanggal']}\n${disposisi?[index]['jam']}'
                        : (index == 0
                            ? ''
                            : '${disposisi?[index]['tanggal']}\n${disposisi?[index]['jam']}');
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text),
                    );
                  },
                  contentsBuilder: (context, index) {
                    if (kDebugMode) {
                      print(disposisi!.length);
                    }
                    final String text = disposisi!.length == 1
                        ? '${disposisi![index]['telitiSaran']}'
                        : (index == 0 || index == disposisi!.length-1
                            ? '${disposisi![index]['telitiSaran']}'
                            : '${disposisi![index]['nama']}: ${disposisi![index]['telitiSaran']}');
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(text),
                      ),
                    );
                  },
                  connectorStyleBuilder: (context, index) =>
                      ConnectorStyle.solidLine,
                  // indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                  itemCount: disposisi!.length,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 8,),
                      Text("Tracking Surat"),
                      SizedBox(width: 8,),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
