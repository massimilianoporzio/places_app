import 'package:flutter/material.dart';

import 'app_bar.dart';

class HomePageLarge extends StatelessWidget {
  const HomePageLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PlacesAppBar(),
      body: Center(child: Text('large')),
    );
  }
}
