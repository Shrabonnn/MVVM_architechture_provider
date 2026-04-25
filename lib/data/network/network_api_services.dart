import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic resonponseJson;

    try {
      final uri = Uri.parse(url);
      Response response = await get(uri);

      resonponseJson = returnResponse(response);
      //return na korle viewmodel pabe na

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return resonponseJson;
  }

  @override
  Future<void> getPostApiResponse(String url, dynamic data) async {
    dynamic resonponseJson;

    try {
      final uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      resonponseJson = returnResponse(response);
      //return na korle viewmodel pabe na
      //return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return resonponseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());

      case 404:
        throw BadRequestException('Not Found');
      default:
        throw FetchDataException(
          'Error accuired while communication with server with status code ' +
              response.body.toString(),
        );
    }
  }
}
