import 'package:flutter/material.dart';
import 'package:places_app/features/places/presentation/widgets/app_bar.dart';
import 'package:places_app/features/places/presentation/widgets/drawer_body.dart';
import 'package:places_app/features/places/presentation/widgets/places_gallery.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({super.key});

  @override
  State<HomePageSmall> createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PlacesAppBar(),
      drawer: Drawer(
        child: DrawerBody(),
      ),
      body: PlacesGallery(),
    );
  }
}
