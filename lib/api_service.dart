import 'package:dio/dio.dart';
import 'package:horpao_point/config/app_config.dart';
import 'package:horpao_point/constant.dart';

mixin ApiServiceUrlMixin {
  final String getAccountUrl = "account/by-branch";
}

mixin ApiServiceMixin {
  static Dio dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));

  String? get token;

  Future<dynamic> apiGet(String url, {dynamic para}) async {
    try {
      final checkInternet = await Init.checkInternet();
      if (!checkInternet) return null;
      Response response = await dio.get(
        url,
        queryParameters: para,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.type.toString());
      if (e.response == null) {
        return null;
      } else {
        // if (e.response!.statusCode == 401) Init.pref.remove('token');
        // return e.response!.data;
      }
    }
  }

  Future<dynamic> apiPost(String url, {dynamic data, dynamic para}) async {
    Response response;
    try {
      final checkInternet = await Init.checkInternet();
      if (!checkInternet) return null;
      response = await dio.post(
        url,
        data: data,
        queryParameters: para,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      if (e.response == null) {
        return null;
      } else {
        // if (e.response!.statusCode == 401) Init.pref.remove('token');
        // return e.response!.data;
      }
    }
  }

  Future<dynamic> apiPut(String url, {dynamic data, dynamic para}) async {
    try {
      final checkInternet = await Init.checkInternet();
      if (!checkInternet) return null;
      Response response = await dio.put(
        url,
        data: data,
        queryParameters: para,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.type.toString());
      if (e.response == null) {
        return null;
      } else {
        // if (e.response!.statusCode == 401) Init.pref.remove('token');
        // return e.response!.data;
      }
    }
  }

  Future<dynamic> apiPatch(String url, {dynamic data, dynamic para}) async {
    try {
      final checkInternet = await Init.checkInternet();
      if (!checkInternet) return null;
      Response response = await dio.patch(
        url,
        data: data,
        queryParameters: para,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      print(e.type.toString());
      if (e.response == null) {
        return null;
      } else {
        // if (e.response!.statusCode == 401) Init.pref.remove('token');
        // return e.response!.data;
      }
    }
  }

  Future<dynamic> apiDelete(String url, {dynamic data, dynamic para}) async {
    try {
      final checkInternet = await Init.checkInternet();
      if (!checkInternet) return null;
      Response response = await dio.delete(
        url,
        data: data,
        queryParameters: para,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.type.toString());
      if (e.response == null) {
        return null;
      } else {
        // if (e.response!.statusCode == 401) Init.pref.remove('token');
        // return e.response!.data;
      }
    }
  }
}
