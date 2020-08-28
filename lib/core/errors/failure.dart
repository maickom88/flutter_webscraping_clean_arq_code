abstract class Failure implements Exception {}

class InvalidTextSearch implements Failure {}

class DataSourceError implements Failure {
  final String error;
  DataSourceError({this.error});
}
