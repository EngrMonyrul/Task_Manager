class BaseResponse<T> {
  String? status;
  T? data;

  BaseResponse({this.status, this.data});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      BaseResponse(
        status: json["status"],
        data: json["data"] != null ? fromJsonT(json["data"]) : null,
      );
}
