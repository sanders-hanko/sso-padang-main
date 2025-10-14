import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/auth/login_page.dart';
import 'package:super_app/search.dart';
import 'package:super_app/services/berita_service.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<StatefulWidget> createState() => StateLanding();
}

class StateLanding extends State<Landing> {
  final BeritaService _service = BeritaService();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late String tapToSearch = 'Tap untuk cari...';
  late bool doFilter = false;
  late bool stateReady = false;
  late bool isLoggedIn = false;
  late List<Widget> children = [];
  late Widget tombolMasuk = GestureDetector(
    onTap: () {
      Navigator.of(context, rootNavigator: true).push(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return const LoginPage();
          },
        ),
      );
    },
    child: const Text(
      'Masuk',
      style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
    ),
  );

  Future<void> refresh() async {
    setState(() {});
  }

  Future<void> readLogin() async {
    final data = await storage.read(key: 'loggedIn');
    isLoggedIn = data == null ? false : true;
    if (isLoggedIn) {
      tombolMasuk = const Text('');
    }
    setState(() {});
  }

  void setReady() {
    stateReady = true;
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    readLogin();
    super.initState();
    setReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: isLoggedIn ? 48.0 : 0.0,
        actions: [
          isLoggedIn
              ? Container(
                  margin: const EdgeInsets.only(right: 32.0),
                  child: InkWell(
                    splashColor: CupertinoColors.white,
                    highlightColor: CupertinoColors.white,
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return const Search();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      )
                          .then((value) {
                        if (value != null && value != ' ' && value != '') {
                          tapToSearch = value;
                          doFilter = true;
                          setState(() {});
                        } else {
                          tapToSearch = 'Tap untuk cari...';
                          doFilter = false;
                          setState(() {});
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/svg_image/loupe_search.svg',
                      width: 24.0,
                    ),
                  ),
                )
              : const Text('')
        ],
        leading: isLoggedIn
            ? Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      CupertinoIcons.chevron_back,
                      color: Colors.orange,
                    )),
              )
            : const Text(''),
        title: Row(
          mainAxisAlignment:
              isLoggedIn ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            isLoggedIn
                ? const Text('')
                : InkWell(
                    splashColor: CupertinoColors.white,
                    highlightColor: CupertinoColors.white,
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return const Search();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      )
                          .then((value) {
                        if (value != null && value != ' ' && value != '') {
                          tapToSearch = value;
                          doFilter = true;
                          setState(() {});
                        } else {
                          tapToSearch = 'Tap untuk cari...';
                          doFilter = false;
                          setState(() {});
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/svg_image/loupe_search.svg',
                      width: 24.0,
                    ),
                  ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                splashColor: CupertinoColors.white,
                highlightColor: CupertinoColors.white,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return const Search();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  )
                      .then((value) {
                    if (value != null && value != ' ' && value != '') {
                      tapToSearch = value;
                      doFilter = true;
                      setState(() {});
                    } else {
                      tapToSearch = 'Tap untuk cari...';
                      doFilter = false;
                      setState(() {});
                    }
                  });
                },
                child: IgnorePointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: tapToSearch,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.orange.shade400,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.none,
                  ),
                ),
              ),
            ),
            tombolMasuk,
            const SizedBox(width: 16),
          ],
        ),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: _service.getLListBerita(doFilter, tapToSearch, stateReady),
            builder: (
              BuildContext context,
              AsyncSnapshot snapshot,
            ) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/json_image/animation_sibangkom_load.json',
                              width: 200,
                              height: 200,
                              repeat: false,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Memeriksa data...",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (kDebugMode) {
                print(snapshot.data);
                print(snapshot.data.length);
              }

              if (!snapshot.hasData || snapshot.data.length == 0) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/json_image/animation_layanan.json',
                                  repeat: false,
                                  width: 200.0,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Belum ada berita.')],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              children.clear();

              snapshot.data.forEach((value) {
                children.add(
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.7,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(value['image_url']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: CupertinoColors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.3,
                                  child: Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 16.0,
                                        bottom: 16.0,
                                      ),
                                      child: CupertinoListTile(
                                        title: Text(
                                          value['title'],
                                          style:
                                              const TextStyle(fontSize: 12.0),
                                        ),
                                        subtitle: Text(
                                          value['subtitle'],
                                          style:
                                              const TextStyle(fontSize: 10.0),
                                        ),
                                        trailing: ElevatedButton(
                                          onPressed: () {
                                            _launchUrl(value['page_url']);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CupertinoColors.white,
                                            foregroundColor: Colors.blueAccent,
                                          ),
                                          child: const Text('Baca'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              });

              return RefreshIndicator(
                onRefresh: refresh,
                child: ListView(
                  children: children,
                ),
              );
            }),
      ),
    );
  }
}
