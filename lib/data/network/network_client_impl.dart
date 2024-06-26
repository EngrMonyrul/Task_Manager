import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
    late http.Response response;
    log("Requested To: $url");
    try {
      response = await _client.post(url, body: login.toJson());
    } on SocketException {
      log("Socket Exception");
    } on TimeoutException {
      log("Timeout Exception");
    } catch (e) {
      log("Error: $e");
    }
    log("Response: ${response.body}");
    return response;
  }
}
