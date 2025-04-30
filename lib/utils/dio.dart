import 'package:dio/dio.dart';
import 'package:flutter_task/network/model/signup_model.dart';
import 'package:flutter_task/utils/shared_pref_helper.dart';
import 'package:get/get.dart' hide Response, FormData,MultipartFile;
import 'package:image_picker/image_picker.dart';

class DioUtils extends GetxService {
  String _token = '';

  final Dio _dio = Dio(
    // BaseOptions(baseUrl: "https://api-uapsnap.venko.info/api/v1/"),
    BaseOptions(baseUrl: "https://api-stag.trulot.in/v1"),
  );

  DioUtils() {
    addToken();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          print(response.data);
          handler.next(response);
        },
        onRequest: (options, handler) {
          print(options.path);
          print(options.headers.values);
          handler.next(options);
        },
        onError: (error, handler) {
          GetSnackBar(
            message: "Something Went Wrong",
            duration: Duration(seconds: 3),
          );
          handler.next(error);
        },
      ),
    );
  }

  Future<void> addToken() async {
    _token = await SharedPrefHelper.getString("authToken");
    _dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': "Bearer $_token",
    };
  }

  Future<dynamic> get(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: SignupModel.fromJson(e.response?.data).message,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<dynamic> post(String endPoint, [Map<String, dynamic>? data]) async {
    Response response;
    try {
      response = await _dio.post(endPoint, data: data);
      if (response.headers['authorization_token']?.isNotEmpty??false) {
        await SharedPrefHelper.setString(
          "authToken",
          response.headers['authorization_token']?.first??"",
        );
        await Get.find<DioUtils>().addToken();
      }
      return response.data;
    } on DioException catch (e) {
      // Get.showSnackbar(
      //   GetSnackBar(
      //     message: SignupModel.fromJson(e.response?.data).message,
      //     duration: Duration(seconds: 3),
      //   ),
      // );
    }
  }

  Future<dynamic> postImage(String endPoint, MultipartFile multipartFile) async{
    Response response;
    try {
      FormData formData = FormData();
      formData.files.add(MapEntry("profile", multipartFile));
      response = await _dio.post(
        endPoint,
        data: formData,
        options: Options(headers: {'Content-type': 'multipart/form-data'}),
      );
      return response.data;
    } on DioException catch (e) {
      // Get.showSnackbar(
      //   GetSnackBar(
      //     message: SignupModel.fromJson(e.response?.data).message,
      //     duration: Duration(seconds: 3),
      //   ),
      // );
    }
  }

  Future<dynamic> patch(String endPoint,Map<String, dynamic> data, MultipartFile multipartFile) async {
    Response response;
    try {
      FormData formData = FormData();
      formData = FormData.fromMap(data);
      formData.files.add(MapEntry("uploadfile", multipartFile));
      response = await _dio.patch(
        endPoint,
        data: formData,
        options: Options(headers: {'Content-type': 'multipart/form-data'}),
      );
      return response.data;
    } on DioException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: SignupModel.fromJson(e.response?.data).message,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
