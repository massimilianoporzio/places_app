import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:places_app/core/presentation/widgets/error_dialog.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';
import 'package:places_app/features/places/presentation/pages/detail_page.dart';

import '../../domain/entities/place_entity.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TRIGGERA IL CUBIT A CHIEDERE I PLACES COSì LO STATO DEL CUBIT CAMBIA
    context.read<PlacesCubit>().getPlaces();
    return BlocConsumer<PlacesCubit, PlacesState>(
      //reagisce ai cambiamenti di stato del cubit
      listener: (context, state) {
        if (state.status == PlacesStatus.error) {
          errorDialog(context, errorMsg: state.errorMsg!);
        }
      },
      builder: (context, state) {
        if (state.status == PlacesStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == PlacesStatus.loaded) {
          return GridView.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            childAspectRatio: 1 / 1.2, //Width / height
            children: gridItems(state.places!),
          );
        } else if (state.status == PlacesStatus.initial) {
          return const Center(
            child: Text('INITIAL!'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  List<Widget> gridItems(List<Place> places) {
    return places
        .map((place) => _GridItem(
              place: place,
            ))
        .toList();
  }
}

class _GridItem extends StatelessWidget {
  final Place place;
  const _GridItem({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        return Card(
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(place: place),
              ));
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(place.title),
                subtitle: Text(place.subtitle),
              ),
              child: Ink.image(
                image: AssetImage(place.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
