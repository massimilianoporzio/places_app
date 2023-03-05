import '../../domain/entities/place_entity.dart';

abstract class PlacesDatasource {
  Future<List<String>> getStatesOfSouthIndia();
  Future<List<Place>> getPlaces();
  Future<String> getPlaceDescription();
}
