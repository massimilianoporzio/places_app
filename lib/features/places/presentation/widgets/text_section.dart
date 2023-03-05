import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/places_cubit.dart';

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
