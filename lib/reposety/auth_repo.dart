// import 'dart:io';

// import 'package:provider_mvc/data/network/base_api_service.dart';
// import 'package:provider_mvc/data/network/network_api_aervice.dart';
// import 'package:provider_mvc/resources/app_url.dart';

// class AuthRepository {
//   final BaseApiServices _apiServices = NetworkApiService();

//   Future<dynamic> loginApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<dynamic> registerApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }

import 'dart:convert';

import 'package:http/http.dart';

import 'package:provider_mvc/data/network/base_api_service.dart';
import 'package:provider_mvc/data/network/network_api_aervice.dart';

import '../resources/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
