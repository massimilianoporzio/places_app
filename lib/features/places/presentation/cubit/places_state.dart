part of 'places_cubit.dart';

enum PlacesStatus {
  initial,
  loading,
  loaded,
  error;
}

class PlacesState extends Equatable {
  final List<Place>? places;
  final Place? selectedPlace;
  final String? placeDescription;
  final List<String>? statesOfSouthIndia;
  final PlacesStatus status;
  final String? errorMsg;

  const PlacesState({
    this.places,
    this.selectedPlace,
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
    return 'PlacesState(places: $places, selectedPlace: $selectedPlace, placeDescription: $placeDescription, statesOfSouthIndia: $statesOfSouthIndia, status: $status, errorMsg: $errorMsg)';
  }

  @override
  List<Object?> get props {
    return [
      places,
      selectedPlace,
      placeDescription,
      statesOfSouthIndia,
      status,
      errorMsg,
    ];
  }

  PlacesState copyWith({
    List<Place>? places,
    Place? selectedPlace,
    String? placeDescription,
    List<String>? statesOfSouthIndia,
    PlacesStatus? status,
    String? errorMsg,
  }) {
    return PlacesState(
      places: places ?? this.places,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      placeDescription: placeDescription ?? this.placeDescription,
      statesOfSouthIndia: statesOfSouthIndia ?? this.statesOfSouthIndia,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
