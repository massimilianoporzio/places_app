import 'package:flutter/material.dart';

class PlacesAppBar extends StatelessWidget with PreferredSizeWidget {
  const PlacesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Places App'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
