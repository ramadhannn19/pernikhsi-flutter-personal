import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart' show SignInPage;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 2), goLogin);
  }

  void goLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInPage.routeName,
      (_) => false,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(MainAssets.textLogoSvg, width: Dimens.dp200),
      ),
    );
  }
}
