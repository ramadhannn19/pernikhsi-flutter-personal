import 'package:flutter/material.dart';
import 'package:pernikhsi/core/preference/colors.dart';
import 'package:pernikhsi/features/home/widgets/logohsi.dart';

//Import parts of the section page
part 'section/notification_bar.dart';
part 'section/search_bar.dart';
part 'section/carousel/carousel_section.dart';
part 'section/carousel/carousel_item.dart';
part 'section/newarrival/header_section.dart';
part 'section/newarrival/new_arrival_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/homeview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //notification bar
              _NotificationBar(),
              const SizedBox(height: 16),

              //logo hsi
              LogoHsi(key: super.key, size: 30),
              const SizedBox(height: 16),

              //Search bar
              _SearchBar(),
              const SizedBox(height: 24),

              //Carousel section
              _CarouselSection(),
              const SizedBox(height: 24),

              //New Arrival header
              const _NewArrival(),
            ],
          ),
        ),
      ),
    );
  }
}
