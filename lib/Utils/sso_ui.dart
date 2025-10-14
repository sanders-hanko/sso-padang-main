import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class Info extends StatelessWidget {
  const Info(
      {super.key, required this.title, required this.value, this.textSize});

  final String title;
  final String value;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize ?? 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  bottom: 2.0,
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: textSize ?? 14.0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InlineInfo extends StatelessWidget {
  const InlineInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12.0),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header(
      {super.key, required this.title, required this.trailing, this.textSize});

  final String title;
  final Widget trailing;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        // bottom: 8.0,
      ),
      margin: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 16.0,
            ),
          ),
          trailing
        ],
      ),
    );
  }
}

// class Loading extends StatelessWidget {
//   const Loading({super.key, this.isLoading = true, required this.child});
//
//   final bool isLoading;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     if (!isLoading) {
//       return child;
//     }
//
//     return Shimmer.fromColors(
//       baseColor: Colors.black12,
//       highlightColor: Colors.white,
//       child: child,
//     );
//   }
// }

class PdgCard extends StatelessWidget {
  const PdgCard({super.key, required this.header, required this.body});

  final Widget header;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 0), blurRadius: 8.0),
          ]),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [header],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: body,
            ),
          ),
        ],
      ),
    );
  }
}

class PdgGrid extends StatelessWidget {
  const PdgGrid(
      {super.key,
      required this.icon,
      required this.text,
      this.ref,
      required this.iconSize,
      required this.textSize,
      required this.extendSize});

  final IconData? icon;
  final double iconSize;
  final String text;
  final double textSize;
  final Widget? ref;
  final double extendSize;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.extent(
      crossAxisCellCount: 1,
      mainAxisExtent: extendSize,
      child: TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size(40, 80), alignment: Alignment.topCenter),
        onPressed: () {
          if (ref != null) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).push(
              CupertinoPageRoute(builder: (context) {
                return ref!;
              }),
            );
          }
        },
        child: Column(children: [
          Icon(
            icon,
            size: iconSize,
            weight: 0.1,
            color: ref != null ? Colors.blueAccent.shade100 : Colors.grey,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.black87,
              fontWeight: FontWeight.normal,
            ),
          )
        ]),
      ),
    );
  }
}

class NewGrid extends StatelessWidget {
  const NewGrid(
      {super.key,
      required this.screenWidth,
      required this.textSize,
      this.ref,
      required this.iconSize,
      required this.text,
      this.badgeText = '',
      required this.asset});

  final double screenWidth;
  final double iconSize;
  final double textSize;
  final Widget? ref;
  final String text;
  final String? badgeText;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ref != null) {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(builder: (context) {
              return ref!;
            }),
          );
        }
      },
      child: Column(
        children: [
          SizedBox(
            // height: 0.2256 * screenWidth,
            height: 0.2 * screenWidth,
            // width: 0.2256 * screenWidth,
            width: 0.2 * screenWidth,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: EdgeInsets.all(0.1 * constraints.maxWidth),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.45 * iconSize),
                  ),
                  color: ref != null ? CupertinoColors.white : Colors.white,
                  surfaceTintColor: CupertinoColors.white,
                  child: Center(
                    child: badges.Badge(
                      showBadge: badgeText != '' ? true : false,
                      position: badges.BadgePosition.topEnd(
                        top: -(0.3 * constraints.maxWidth),
                        end: -(0.2 * constraints.maxWidth),
                      ),
                      badgeContent: Text(
                        badgeText!,
                        style: TextStyle(
                          fontSize: textSize-5,
                          color: CupertinoColors.white,
                        ),
                        textScaler: const TextScaler.linear(1.2),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        elevation: 10,
                        badgeColor: badgeText == "soon" ? Colors.orange : Colors.red
                      ),
                      child: SvgPicture.asset(
                        asset,
                        width: iconSize,
                      ),
                      // child: Icon(
                      //   icon,
                      //   size: iconSize,
                      // ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      ),
    );
  }
}
