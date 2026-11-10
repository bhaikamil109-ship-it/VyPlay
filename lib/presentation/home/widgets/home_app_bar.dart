import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_bloc.dart';
import '../../../core/constants.dart';
import '../../../core/di/injectable.dart';
import '../../search/screen_search.dart';
import '../../settings/screen_settings.dart';
import 'circular_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 60,
      elevation: 0,
      surfaceTintColor: kWhiteColor,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF9F4034), Color(0xFF7F291F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'VyPlay',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => getIt<SearchBloc>(),
              child: const ScreenSearch(),
            ),
          )),
          child: const CircularIcon(
            icon: CupertinoIcons.search,
          ),
        ),
        kWidthBox10,
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ScreenSettings(),
          )),
          child: const CircularIcon(
            icon: CupertinoIcons.gear,
          ),
        ),
        kWidthBox20,
      ],
    );
  }
}
