import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/core/presentation/widgets/error_dialog.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PlacesCubit>().getStatesOfSouthIndia();
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state.status == PlacesStatus.error) {
          errorDialog(context, errorMsg: state.errorMsg!);
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case PlacesStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PlacesStatus.loaded:
            return ListView.builder(
              itemCount:
                  state.statesOfSouthIndia!.length + 1, //header del drawer
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index == 0) {
                } else {}
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
