import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
class Request{
  static Future<dynamic> ge ({required String action,Map? params}) async{
      return Request.mock(action: action,params: params);
  }

  static Future<dynamic> pos ({required String action,Map? params}) async{
    return Request.mock(action: action,params: params);
  }

  static Future<dynamic> mock({required String action,Map? params}) async {
    var reponseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(reponseStr);
    return responseJson['data'];
  }
}