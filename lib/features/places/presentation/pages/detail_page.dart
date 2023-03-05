import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

import '../../domain/entities/place_entity.dart';
import '../widgets/button_section.dart';
import '../widgets/text_section.dart';
import '../widgets/title_section.dart';

class DetailPage extends StatelessWidget {
  final Place place;
  const DetailPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.subtitle),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset(
            place.image,
            height: 300,
            fit: BoxFit.cover,
          ),
          TitleSection(
            place: place,
          ),
          const ButtonSection(),
          const TextSection(),
        ],
      ),
    );
  }
}
