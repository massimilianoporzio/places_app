import 'package:dartz/dartz.dart';
import 'package:places_app/core/errors/exceptions.dart';

import 'package:places_app/core/errors/failures.dart';
import 'package:places_app/features/places/domain/entities/place_entity.dart';
import 'package:places_app/features/places/domain/repositories/places_repository.dart';

import '../datasources/places_remote_datasource.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDatasource localDatasource;
  PlacesRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, String>> getPlaceDescription() async {
    try {
      final result = await localDatasource.getPlaceDescription();
      return Right(result);
    } on LocalDataSourceException {
      return Left(LocalDataSourceFailure(
          message: 'Error in retrieving place description'));
    }
  }

  @override
  Future<Either<Failure, List<Place>>> getPlaces() async {
    try {
      //GUARDO IN CACHE

      final result = await localDatasource.getPlaces();
      if (result.isNotEmpty) {
        //METTO IN CACHE
      }
      return Right(result);
    } on LocalDataSourceException {
      return Left(
          LocalDataSourceFailure(message: 'Error in retrieving places'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getStatesOfSouthIndia() async {
    try {
      final result = await localDatasource.getStatesOfSouthIndia();
      return Right(result);
    } on LocalDataSourceException {
      return Left(LocalDataSourceFailure(
          message: 'Error in retrieving stattes of South India'));
    }
  }
}
