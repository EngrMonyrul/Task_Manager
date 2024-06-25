import '../../models/login/login.dart';
import 'package:http/http.dart' as http;

abstract class NetworkClient {
  Future<http.Response> loginSystem({required Login login});
}
