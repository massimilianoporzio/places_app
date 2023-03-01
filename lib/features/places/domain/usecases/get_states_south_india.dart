import 'package:dartz/dartz.dart';

import 'package:places_app/core/errors/failures.dart';
import 'package:places_app/core/usecases/base_usecase.dart';
import 'package:places_app/features/places/domain/repositories/places_repository.dart';

class GetStatesOfSouthIndiaUseCase extends BaseUseCase<List<String>, NoParams> {
  final PlacesRepository placesRepository;
  GetStatesOfSouthIndiaUseCase({
    required this.placesRepository,
  });

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return placesRepository.getStatesOfSouthIndia();
  }
}
