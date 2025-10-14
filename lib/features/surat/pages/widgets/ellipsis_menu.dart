import 'package:flutter/cupertino.dart';

class EllipsisMenu extends StatelessWidget {
  const EllipsisMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.only(top: 16.0),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: CupertinoListTile(
        onTap: () {
          Navigator.pop(context, true);
        },
        title: Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cancel'),
            ],
          ),
        ),
      ),
    );
  }
}
