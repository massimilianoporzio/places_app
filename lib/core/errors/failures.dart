abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });

  @override
  String toString() => 'Failure(message: $message)';
}

class GenericFailure extends Failure {
  GenericFailure(
      {super.message = 'Oops. Something gone wrong! Please, retry.'});
}

class LocalDataSourceFailure extends Failure {
  LocalDataSourceFailure({required super.message});
}
