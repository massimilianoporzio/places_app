import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

import '../../domain/entities/place_entity.dart';

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

class TitleSection extends StatelessWidget {
  final Place place;
  const TitleSection({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            //prende tutto il resto dello spazio lasciato
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    place.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  place.subtitle,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text('41'),
          )
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonColumn(color, Icons.call, 'CALL'),
          buttonColumn(color, Icons.near_me, 'ROUTE'),
          buttonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  buttonColumn(Color color, IconData iconData, String label) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PlacesCubit>().getPlaceDescription();
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {},
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          state.placeDescription!,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
