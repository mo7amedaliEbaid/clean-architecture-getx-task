abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ServerFailure extends Failure {
  const ServerFailure({String message = ''}) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({String message = ''}) : super(message);
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({String message = ''}) : super(message);
}

class UnVerifiedFailure extends Failure {
  const UnVerifiedFailure({String message = ''}) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({String message = ''}) : super(message);
}

class ExceptionFailure extends Failure {
  const ExceptionFailure({String message = ''}) : super(message);
}