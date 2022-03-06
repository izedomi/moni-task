class ServiceResponse {
  bool hasError;
  dynamic data;
  String? message;
  dynamic pagination;

  ServiceResponse({
    required this.hasError,
    this.data,
    this.message,
    this.pagination,
  });
}
