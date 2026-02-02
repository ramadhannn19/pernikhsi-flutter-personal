import 'package:flutter/material.dart';
import 'package:pernikhsi/core/preference/colors.dart';
import 'package:pernikhsi/features/home/presentation/pages/widgets/logohsi.dart';

//Import parts of the homeview page
part 'section/notification_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/homeview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //notification bar
            const NotificationBar(),
            const SizedBox(height: 16),

            //logo hsi
            LogoHsi(key: super.key, size: 30),
          ],
        ),
      ),
    );
  }
}
