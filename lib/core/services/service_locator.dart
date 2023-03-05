import 'package:get_it/get_it.dart';
import 'package:places_app/features/places/data/datasources/places_local_datasource.dart';
import 'package:places_app/features/places/data/repositories/places_repository_impl.dart';
import 'package:places_app/features/places/domain/repositories/places_repository.dart';
import 'package:places_app/features/places/domain/usecases/get_place_description.dart';
import 'package:places_app/features/places/domain/usecases/get_places.dart';
import 'package:places_app/features/places/domain/usecases/get_states_south_india.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

import '../../features/places/data/datasources/places_datasource.dart';
import '../../features/places/data/datasources/places_remote_datasource.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //BLOCS/ CUBITS
  sl.registerFactory<PlacesCubit>(() => PlacesCubit(
        getPlaceDescriptionuseCase: sl(),
        getPlacesUseCase: sl(),
        getStatesOfSouthIndiaUseCase: sl(),
      ));

  //USECASES
  sl.registerLazySingleton<GetPlaceDescriptionuseCase>(
      () => GetPlaceDescriptionuseCase(placesRepository: sl()));

  sl.registerLazySingleton<GetPlacesUseCase>(
      () => GetPlacesUseCase(placesRepository: sl()));

  sl.registerLazySingleton<GetStatesOfSouthIndiaUseCase>(
      () => GetStatesOfSouthIndiaUseCase(placesRepository: sl()));

  //REPOSITORIES
  sl.registerLazySingleton<PlacesRepository>(
      () => PlacesRepositoryImpl(localDatasource: sl()));

  //DATASOURCES
  sl.registerLazySingleton<PlacesDatasource>(() => LocalPlacesDataSource());

  //EXTERNALS
}
