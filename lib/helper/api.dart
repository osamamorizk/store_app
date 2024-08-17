import 'package:dio/dio.dart';

class Api {
  get(String url) async {
    final Map<String, String> headers = {
      'lang': 'en',
    };
    final Dio dio = Dio();
    Response response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there was an error the status Code is ${response.statusCode} ');
    }
  }
}
