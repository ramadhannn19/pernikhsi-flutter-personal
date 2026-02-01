import 'package:flutter/material.dart';
import 'package:pernikhsi/core/preference/colors.dart';

part 'section/notification_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const String routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [const NotificationBar()])),
    );
  }
}
