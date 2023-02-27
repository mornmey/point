abstract class AppException implements Exception {
  final String title;
  final String message;
  final int? code;

  AppException({required this.title, required this.message, required this.code});
}

class NoInternetException extends AppException {
  NoInternetException({
    String message: "Please check your internet connection. Then try again.",
    String title: "No Internet Connection",
  }) : super(message: message, title: title, code: 1);
}

class NotFoundException extends AppException {
  NotFoundException({
    String message: "We cannot found any result.",
    String title: "Not Found",
  }) : super(message: message, title: title, code: 404);
}

class OtherExceptions extends AppException {
  OtherExceptions({
    String message: "Error has occurred.",
    String title: "Error",
  }) : super(message: message, title: title, code: 2);
}

class SocketException extends AppException {
  SocketException(
      {String message: "No address associated with hostname", String title: "Failed Hostname"})
      : super(message: message, title: title, code: 7);
}

class PermissionDeniedForeverException extends AppException {
  PermissionDeniedForeverException(
      {String message: "Press confirm, to grant permission.",
      String title: "Permission not granted"})
      : super(message: message, title: title, code: 1000);
}
