import 'package:places_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:places_app/core/usecases/base_usecase.dart';
import 'package:places_app/features/places/domain/repositories/places_repository.dart';

class GetPlaceDescriptionuseCase extends BaseUseCase<String, NoParams> {
  final PlacesRepository placesRepository;

  GetPlaceDescriptionuseCase({required this.placesRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return placesRepository.getPlaceDescription();
  }
}
