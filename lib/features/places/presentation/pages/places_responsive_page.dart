import 'package:flutter/material.dart';
import 'package:places_app/core/utils/screen_sizes.dart';
import 'package:places_app/features/places/presentation/widgets/large/home_page_large.dart';
import 'package:places_app/features/places/presentation/widgets/medium/home_page_medium.dart';
import 'package:places_app/features/places/presentation/widgets/small/home_page_small.dart';

class PlacesResponsivePage extends StatelessWidget {
  const PlacesResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ScreenSize screenSize = getScreenSize(width);
    switch (screenSize) {
      case ScreenSize.small:
        return const HomePageSmall();
      case ScreenSize.medium:
        return const HomePageMedium();
      case ScreenSize.large:
        return const HomePageLarge();

      default:
        return const HomePageLarge();
    }
  }
}
