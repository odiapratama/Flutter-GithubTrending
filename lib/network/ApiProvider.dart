import 'dart:convert';
import 'package:githubtrending/network/CustomException.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

const String PATH = "repositories?language=dart&since=weekly";

class ApiProvider {
  static const String BASE_URL = "https://ghapi.huchen.dev/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(BASE_URL + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
