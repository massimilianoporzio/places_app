import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/core/presentation/widgets/error_dialog.dart';
import 'package:places_app/core/utils/screen_sizes.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

import '../../domain/entities/place_entity.dart';
import '../pages/detail_page.dart';

class PlacesGallery extends StatelessWidget {
  final bool showHorizontalGridView;
  const PlacesGallery({
    Key? key,
    this.showHorizontalGridView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount;
    Axis axisDirection;
    context.read<PlacesCubit>().getPlaces();

    if (showHorizontalGridView) {
      itemCount = 1; //singleRow (1 col)
      axisDirection = Axis.horizontal;
    } else {
      itemCount = 2;
      axisDirection = Axis.vertical;
    }

    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state.status == PlacesStatus.error) {
          errorDialog(context, errorMsg: state.errorMsg!);
        } else if (state.status == PlacesStatus.loaded) {
          // if (state.places!.isNotEmpty) {
          //   //selez il primo
          //   context.read<PlacesCubit>().setSelectedPlace(state.places![0]);
          // }
        }
      },
      builder: (context, state) {
        if (state.status == PlacesStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state.selectedPlace == null && state.places!.isNotEmpty) {
            //selez il primo se non ho ancora selez nulla
            context.read<PlacesCubit>().setSelectedPlace(state.places![0]);
          }
          return Container(
            color: Colors.grey.shade500,
            child: GridView.count(
              crossAxisCount: itemCount,
              scrollDirection: axisDirection,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 1 / 1.2,
              children: _gridItems(context, state.places!),
            ),
          );
        }
      },
    );
  }

  List<Widget> _gridItems(BuildContext context, List<Place> places) {
    if (places.isEmpty) {
      return [];
    } else {
      return places
          .map((place) => _GridItem(
                place: place,
              ))
          .toList();
    }
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
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          switch (getScreenSize(MediaQuery.of(context).size.width)) {
            case ScreenSize.small:
            case ScreenSize.medium:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceDetailsPage(place),
              ));
              break;
            case ScreenSize.large:
              context.read<PlacesCubit>().setSelectedPlace(place);
              break;
            default:
          }
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
  }
}
