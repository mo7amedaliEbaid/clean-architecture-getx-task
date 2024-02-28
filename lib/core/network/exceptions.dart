class EmptyCashException implements Exception {}

class WrongDataException implements Exception {
  WrongDataException(this.message);

  final String message;
}

class UserNameException implements Exception {}

class BlockedException implements Exception {}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnAuthorizedException implements Exception {
  UnAuthorizedException();
}

class UnVerifiedException implements Exception {
  UnVerifiedException();
}

class DatabaseException implements Exception {
  DatabaseException();
}