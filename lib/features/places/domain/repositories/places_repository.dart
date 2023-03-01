import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/place_entity.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<String>>> getStatesOfSouthIndia();
  Future<Either<Failure, List<Place>>> getPlaces();
  Future<Either<Failure, String>> getPlaceDescription();
}
