import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/features/places/presentation/widgets/drawer_body.dart';
import 'package:places_app/features/places/presentation/widgets/places_gallery.dart';

import '../../cubit/places_cubit.dart';
import '../app_bar.dart';
import '../place_details_responsive.dart';

class HomePageLarge extends StatelessWidget {
  const HomePageLarge({super.key});

  @override
  Widget build(BuildContext context) {
    //TRIGGERA IL CUBIT A CHIEDERE I PLACES COSì LO STATO DEL CUBIT CAMBIA
    context.read<PlacesCubit>().getPlaces();
    return Scaffold(
      appBar: const PlacesAppBar(),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: DrawerBody(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey.shade500,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: PlacesGallery(
                        showHorizontalGridView: true,
                      ),
                    ),
                    BlocBuilder<PlacesCubit, PlacesState>(
                      builder: (context, state) {
                        if (state.status == PlacesStatus.loaded &&
                            state.selectedPlace == null &&
                            state.places!.isNotEmpty) {
                          context
                              .read<PlacesCubit>()
                              .setSelectedPlace(state.places![0]);
                        }

                        return Expanded(
                          flex: 2,
                          child: PlaceDetails(
                            place: state.selectedPlace!,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
