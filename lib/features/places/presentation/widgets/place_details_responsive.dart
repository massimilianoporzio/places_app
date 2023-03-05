import 'package:flutter/material.dart';
import 'package:places_app/features/places/presentation/widgets/button_section.dart';
import 'package:places_app/features/places/presentation/widgets/text_section.dart';
import 'package:places_app/features/places/presentation/widgets/title_section.dart';

import '../../domain/entities/place_entity.dart';

class PlaceDetailsResponsive extends StatelessWidget {
  final Place place;
  const PlaceDetailsResponsive({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 600) {
          return _largeWidget(color);
        } else {
          return _smallWidget(color);
        }
      },
    );
  }

  Widget _largeWidget(Color color) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  Widget _smallWidget(Color color) {
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          fit: BoxFit.cover,
        ),
        TitleSection(place: place),
        const ButtonSection(),
        const TextSection()
      ],
    );
  }
}
