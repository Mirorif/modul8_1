import 'dart:convert';

import 'package:http/http.dart';
import '../models/users_info_model.dart';

class Network{
  static const String BASE = "api.github.com";
  static Map<String, String> headers = {"Content-Type" : "application/json; charset=UTF-8"};

  /* Http Api */
  static String API_LIST = "/users/Mirorif";

  /* Http Request */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  /* Http Params */
  static Map<String, String> paramsEmpty(){
    Map<String, String> params={};
    return params;
  }

  static UserInfo parseUserInfo(String response){
    dynamic json = jsonDecode(response);
    var data =  UserInfo.fromJson(json);
    return data;
  }

}
