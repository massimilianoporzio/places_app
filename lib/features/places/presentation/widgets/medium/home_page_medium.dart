import 'package:flutter/material.dart';
import 'package:places_app/features/places/presentation/widgets/drawer_body.dart';
import 'package:places_app/features/places/presentation/widgets/places_gallery.dart';

import '../app_bar.dart';

class HomePageMedium extends StatelessWidget {
  const HomePageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlacesAppBar(),
      body: Row(
        children: const [
          Expanded(flex: 2, child: DrawerBody()),
          Expanded(flex: 5, child: PlacesGallery()),
        ],
      ),
    );
  }
}
