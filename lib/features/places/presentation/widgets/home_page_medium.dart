import 'package:flutter/material.dart';

import 'app_bar.dart';

class HomePageMedium extends StatelessWidget {
  const HomePageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PlacesAppBar(),
      body: Center(child: Text('medium')),
    );
  }
}
