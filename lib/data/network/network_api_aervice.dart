// import 'dart:convert';

// import 'dart:io';

// import 'package:provider_mvc/data/app_exceptions.dart';
// import 'package:provider_mvc/data/network/base_api_service.dart';
// import 'package:http/http.dart';

// class NetworkApiService extends BaseApiServices {
//   @override
//   Future getGetApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response =
//           await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   @override
//   Future<dynamic> getPostApiResponse(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       Response response = await post(Uri.parse(url), body: data)
//           .timeout(const Duration(seconds: 10));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   dynamic returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;

//       default:
//         throw FetchDataException('Error occured during Establishing connection'
//             'with Status Code ${response.statusCode}');
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:provider_mvc/data/app_exceptions.dart';
import 'package:provider_mvc/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
}
