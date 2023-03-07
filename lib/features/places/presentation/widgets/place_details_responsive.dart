import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/core/presentation/widgets/error_dialog.dart';
import 'package:places_app/features/places/presentation/widgets/button_section.dart';
import 'package:places_app/features/places/presentation/widgets/text_section.dart';
import 'package:places_app/features/places/presentation/widgets/title_section.dart';

import '../../domain/entities/place_entity.dart';
import '../cubit/places_cubit.dart';

class PlaceDetails extends StatelessWidget {
  final Place place;

  const PlaceDetails({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 600.00) {
          return _largeWidget(color);
        } else {
          return _smallWidget(color);
        }
      },
    );
  }

  Widget _largeWidget(Color color) {
    return BlocConsumer<PlacesCubit, PlacesState>(
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
        } else {
          if (state.status == PlacesStatus.loaded) {
            return SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(place!.image),
                          TitleSection(place: place!)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: ButtonSection(),
                          ),
                          TextSection(
                            placeDescription: place!.description,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }

  Widget _smallWidget(
    Color color,
  ) {
    return ListView(
      children: [
        Image.asset(
          place!.image,
          height: 320,
          fit: BoxFit.cover,
        ),
        TitleSection(place: place!),
        const ButtonSection(),
        TextSection(placeDescription: place!.description),
      ],
    );
  }
}
