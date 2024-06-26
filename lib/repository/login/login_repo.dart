import 'dart:convert';

import 'package:task_manager/data/local/shared_pref.dart';
import 'package:task_manager/data/network/network_client.dart';
import 'package:task_manager/data/network/network_client_impl.dart';
import 'package:task_manager/models/base_response.dart';
import 'package:task_manager/models/login/login.dart';
import 'package:task_manager/models/login/login_response.dart';

class LoginRepo {
  final NetworkClient _networkClient = NetworkClientImpl();
  final SharedPref _sharedPref = SharedPrefImpl();

  Future<BaseResponse<LoginResponse>> loginSystem(
      {required Login login}) async {
    final result = await _networkClient.loginSystem(login: login);
    if (result.statusCode == 200) {
      final decodedResult = jsonDecode(result.body);
      _sharedPref.setToken(value: decodedResult["token"]);
      print(_sharedPref.token);
      print(decodedResult);
    } else {
      return BaseResponse<LoginResponse>(
          status: "failed", data: LoginResponse());
    }
    return BaseResponse<LoginResponse>(status: "failed", data: LoginResponse());
  }
}
