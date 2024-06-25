import 'dart:convert';

import 'package:task_manager/data/network/network_client.dart';
import 'package:task_manager/models/base_response.dart';
import 'package:task_manager/models/login/login.dart';
import 'package:task_manager/models/login/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/utils/constants/http_endpoints.dart';

class NetworkClientImpl extends NetworkClient {
  final http.Client _client = http.Client();

  @override
  Future<http.Response> loginSystem({required Login login}) async {
    final url = Uri.parse(HttpEndpoints.baseUrl + HttpEndpoints.login);
    final bodyJson = jsonEncode(login);
    final response = await _client.post(url, body: bodyJson);
    return response;
  }
}
