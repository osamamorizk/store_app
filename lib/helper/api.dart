import 'package:dio/dio.dart';

class Api {
  get({required String url, String? token}) async {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      headers: {
        'lang': 'en',
        'Authorization': token,
      },
    );

    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there was an error the status Code is ${response.statusCode} ');
    }
  }

  post({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    final Dio dio = Dio();
    // final Map<String, String> headers = {
    //   'lang': 'en',
    //   'Autheraizart': token
    // };

    dio.options = BaseOptions(
      headers: {
        'lang': 'en',
        'Authorization': token,
      },
    );

    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there was an error the status Code is ${response.statusCode} ');
    }
  }
}
