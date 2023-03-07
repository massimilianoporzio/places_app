import 'package:places_app/features/places/domain/entities/place_entity.dart';

class PlaceModel extends Place {
  const PlaceModel(
      {required super.image,
      required super.title,
      required super.subtitle,
      required super.description});

  factory PlaceModel.fromJson(Map<String, dynamic> map) {
    return PlaceModel(
        image: map['image'] ?? '',
        title: map['title'] ?? '',
        subtitle: map['subtitle'] ?? '',
        description: map['description'] ?? '');
  }
}
