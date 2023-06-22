import 'package:authentication/utils/constants/app_constants.dart';
import 'package:dio/dio.dart';


class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  var dio = Dio();

  void update(token) {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {'Authorization': "Bearer " + token},
      connectTimeout: Duration(seconds:60 ),
      receiveTimeout:  Duration(seconds:60 ),
    );

    dio = Dio(options);
  }

  void create() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: Duration(seconds:60 ),
      receiveTimeout:  Duration(seconds:60 ),
      
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          print("= = = Dio Request = = =");
          print(options.headers);
          print(options.contentType);

          print(options.extra);

          print(options.baseUrl + "" + options.path);

          print(options.data);
          print("= = = Dio End = = =");
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          print(error.message);
          return handler.next(error);
        },
        onResponse: (Response response, handler) {
          print("= = = Dio Response = = =");
          print(response.data);
          print(response.extra);
          print(response.statusCode);
          print(response.statusMessage);
          print("= = = Dio End = = =");
          return handler.next(response);
        },
      ),
    );
  }
}

Future<Response> postHttp({
  required String path,
  dynamic data,
}) async {
  return DioSingleton.instance.dio.post(path, data: data);
}

Future getHttp({required String path}) async {
  return DioSingleton.instance.dio.get(path);
}

Future<Response> postWithoutBase({required String path, dynamic data}) async {
  return Dio().post(path, data: data);
}
