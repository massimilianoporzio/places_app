import 'package:flutter/material.dart';
import 'package:places_app/features/places/presentation/widgets/home_screen_widget.dart';

class PlacesHomePage extends StatelessWidget {
  const PlacesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Places App')),
      body: const HomeScreenWidget(),
    );
  }
}
