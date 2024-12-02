abstract class GeneralException implements Exception {
  const GeneralException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

class UnathenticatedException extends GeneralException {
  UnathenticatedException(super.message);
}

class BadRequestException extends GeneralException {
  BadRequestException(super.message);
}

class NotFoundException extends GeneralException {
  NotFoundException(super.message);
}
