import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailAktivitas extends StatelessWidget {
  const DetailAktivitas({
    super.key,
    required this.id,
    required this.url,
    required this.aktivitas,
    required this.tanggal,
  });

  final String id;
  final String url;
  final String aktivitas;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 128.0),
                  child: Hero(
                    tag: id,
                    child: Image.network(
                      url,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black38,
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        right: 32.0,
                        top: 16.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            tanggal,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black38,
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        right: 32.0,
                        bottom: 16.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          aktivitas,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
