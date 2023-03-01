import 'package:dartz/dartz.dart';

import 'package:places_app/core/errors/failures.dart';
import 'package:places_app/core/usecases/base_usecase.dart';
import 'package:places_app/features/places/domain/repositories/places_repository.dart';

import '../entities/place_entity.dart';

class GetPlacesUseCase extends BaseUseCase<List<Place>, NoParams> {
  final PlacesRepository placesRepository;
  GetPlacesUseCase({
    required this.placesRepository,
  });
  @override
  Future<Either<Failure, List<Place>>> call(NoParams params) {
    return placesRepository.getPlaces();
  }
}
