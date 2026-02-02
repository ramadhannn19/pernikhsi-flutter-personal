import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoHsi extends StatelessWidget {
  const LogoHsi({
    //use parameter to set size
    super.key,
    this.size = 80, // default
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/text-logo.svg',
      height: size,
      width: size,
    );
  }
}
