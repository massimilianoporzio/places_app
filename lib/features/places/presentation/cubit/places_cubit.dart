import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/core/usecases/base_usecase.dart';

import 'package:places_app/features/places/domain/usecases/get_place_description.dart';
import 'package:places_app/features/places/domain/usecases/get_places.dart';
import 'package:places_app/features/places/domain/usecases/get_states_south_india.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/place_entity.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final GetPlaceDescriptionuseCase getPlaceDescriptionuseCase;
  final GetStatesOfSouthIndiaUseCase getStatesOfSouthIndiaUseCase;
  final GetPlacesUseCase getPlacesUseCase;

  PlacesCubit(
    this.getPlaceDescriptionuseCase,
    this.getStatesOfSouthIndiaUseCase,
    this.getPlacesUseCase,
  ) : super(PlacesState.initial());

  void getStatesOfSouthIndia() async {
    emit(state.copyWith(status: PlacesStatus.loading));
    final response = await getStatesOfSouthIndiaUseCase(NoParams());
    response.fold(
      (failure) => emit(
        state.copyWith(
          errorMsg: failure.message,
          status: PlacesStatus.error,
        ),
      ),
      (statesOfSouthIndia) => emit(state.copyWith(
          status: PlacesStatus.loaded, statesOfSouthIndia: statesOfSouthIndia)),
    );
  }

  void getPlaceDescription() async {
    emit(state.copyWith(status: PlacesStatus.loading));
    final response = await getPlaceDescriptionuseCase(NoParams());
    response.fold(
      (failure) => emit(
        state.copyWith(
          errorMsg: failure.message,
          status: PlacesStatus.error,
        ),
      ),
      (description) => emit(state.copyWith(
          status: PlacesStatus.loaded, placeDescription: description)),
    );
  }

  void getPlaces() async {
    emit(state.copyWith(status: PlacesStatus.loading));
    final response = await getPlacesUseCase(NoParams());
    response.fold(
      (failure) => emit(
        state.copyWith(
          errorMsg: failure.message,
          status: PlacesStatus.error,
        ),
      ),
      (places) =>
          emit(state.copyWith(status: PlacesStatus.loaded, places: places)),
    );
  }
}
