enum ApiEnum {
  success,
  failed,
  timeout,
  unauthorized;

  String? get text => switch (this) {
        success => "Success",
        failed => "Failed",
        timeout => "Timeout",
        unauthorized => "Unauthorized",
        _ => null,
      };

  static List<ApiEnum> get list => values;
}
