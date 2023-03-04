import 'package:flutter/material.dart';
import 'package:places_app/features/places/presentation/widgets/app_bar.dart';

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
      body: Center(child: Text('small')),
    );
  }
}
