import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String placeDescription;
  const TextSection({super.key, required this.placeDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        placeDescription,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
