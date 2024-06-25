class BaseResponse<T> {
  bool? success;
  T? data;
  int? statusCode;

  BaseResponse({this.success, this.data, this.statusCode});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(String) fromJsonT) =>
      BaseResponse();
}
