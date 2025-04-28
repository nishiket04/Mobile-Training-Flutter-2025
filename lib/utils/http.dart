import 'dart:io';

import 'package:flutter_task/utils/shared_pref_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as  http;
import 'package:http_parser/http_parser.dart';



class HttpUtils extends GetxService{
  String _token = '';
  String _baseUrl = "https://api-uapsnap.venko.info/api/v1";

  Future<void> addToken() async {
    _token = await SharedPrefHelper.getString("authToken");
  }

  Future<dynamic> get(String endPoint) async {
    http.Response response;
    try {
      response = await http.get(Uri.parse(_baseUrl+endPoint),headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'});
      return response.body;
    }catch (e) {
    }
  }

  Future<dynamic> post(String endPoint, Map<String, dynamic> data) async {
    http.Response response;
    try {
      response = await http.post(Uri.parse(_baseUrl+endPoint),body: data);
      return response.body;
    } catch (e) {
      // Get.showSnackbar(
      //   GetSnackBar(
      //     message: SignupModel.fromJson(e.response?.data).message,
      //     duration: Duration(seconds: 3),
      //   ),
      // );
    }
  }

  Future<dynamic> patch(String endPoint,Map<String, String> data, File multipartFile) async {
    http.StreamedResponse response;
    try {
      var request = http.MultipartRequest(
        'PATCH', Uri.parse(_baseUrl+endPoint),
      );
      Map<String,String> headers={
        "Authorization":"Bearer $_token",
      };
      request.files.add(
        http.MultipartFile(
          'uploadfile',
          multipartFile.readAsBytes().asStream(),
          multipartFile.lengthSync(),
          filename: "uploadfile",
          contentType: MediaType('image', 'jpg'),
        ),
      );
      request.fields.addAll(data);
      request.headers.addAll(headers);
      response = await request.send();
      return response.stream.bytesToString();
    }catch (e) {
      // Get.showSnackbar(
      //   GetSnackBar(
      //     message: SignupModel.fromJson(e.response?.data).message,
      //     duration: Duration(seconds: 3),
      //   ),
      // );
    }
  }
}