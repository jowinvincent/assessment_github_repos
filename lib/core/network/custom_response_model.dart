class CustomResponseModel<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool isSuccess;

  CustomResponseModel({
    required this.data,
    required this.isSuccess,
    this.message,
    this.statusCode,
  });
}
