part of 'places_cubit.dart';

enum PlacesStatus {
  initial,
  loading,
  loaded,
  error;
}

class PlacesState extends Equatable {
  final List<Place>? places;
  final String? placeDescription;
  final List<String>? statesOfSouthIndia;
  final PlacesStatus status;
  final String? errorMsg;

  const PlacesState({
    this.places,
    this.placeDescription,
    this.statesOfSouthIndia,
    required this.status,
    this.errorMsg,
  });

  factory PlacesState.initial() => const PlacesState(
      status: PlacesStatus.initial,
      places: [],
      placeDescription: '',
      statesOfSouthIndia: []);

  @override
  String toString() {
    return 'PlacesState(places: $places, placeDescription: $placeDescription, statesOfSouthIndia: $statesOfSouthIndia, status: $status, message: $errorMsg)';
  }

  @override
  List<Object?> get props {
    return [
      places,
      placeDescription,
      statesOfSouthIndia,
      status,
      errorMsg,
    ];
  }

  PlacesState copyWith({
    List<Place>? places,
    String? placeDescription,
    List<String>? statesOfSouthIndia,
    PlacesStatus? status,
    String? errorMsg,
  }) {
    return PlacesState(
      places: places ?? this.places,
      placeDescription: placeDescription ?? this.placeDescription,
      statesOfSouthIndia: statesOfSouthIndia ?? this.statesOfSouthIndia,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
