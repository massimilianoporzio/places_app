
import 'package:equatable/equatable.dart';

class Place extends Equatable {
  const Place({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  String toString() =>
      'Place(image: $image, title: $title, subtitle: $subtitle)';

  @override
  List<Object> get props => [image, title, subtitle];
}
