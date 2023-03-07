import 'dart:convert';

import 'package:equatable/equatable.dart';

class Place extends Equatable {
  const Place({
    required this.image,
    required this.title,
    required this.subtitle,
    this.description = '',
  });

  final String image;
  final String title;
  final String subtitle;
  final String description;

  @override
  String toString() =>
      'Place(image: $image, title: $title, subtitle: $subtitle, description: $description)';

  @override
  List<Object> get props => [image, title, subtitle, description];
}
