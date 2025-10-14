import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_bloc.dart';

class PageEmpty extends StatelessWidget {
  const PageEmpty({super.key});

  Future<void> refresh(BuildContext context) async {
    context.read<SuratBloc>().add(const SuratEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        onRefresh: () => refresh(context),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                  child: Lottie.asset(
                    'assets/json_image/animation_error.json',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                const Text('Tidak ada data.'),
                const SizedBox(
                  height: 200.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
