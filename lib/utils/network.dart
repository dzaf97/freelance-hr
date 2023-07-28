import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:myezhr/utils/storage.dart';

String cloudPath =
    "https://myezyhr-development.s3.ap-southeast-1.amazonaws.com";

class Network extends GetxController {
  Map<String, String> defaultHeaders = {
    // "Authorization": "Bearer 1469|Wah1o32I144OBN3D5mb12cMRlfiLPk05WueTR1Jr",
    "Accept": "application/json"
  }.obs;
  Dio http = Dio(
    BaseOptions(
      validateStatus: (status) => true,
      baseUrl: "https://myezyhr.com/api",
    ),
  );

  @override
  void onInit() {
    // String tenant = Storage().getTenant ?? "demo";
    String tenant = Get.find<Storage>().getTenant ?? "demo";
    String companyName = Get.find<Storage>().getCompanyName ?? "Demo";
    // String tenant = "demo";
    // String companyName = "Demo";
    setTenant(tenant);
    Get.find<Storage>().setCompanyName = companyName;
    // Storage().setCompanyName = companyName;
    super.onInit();
  }

  void setTenant(String tenantId) =>
      http.options.baseUrl = "https://$tenantId.myezyhr.com/api";

  void setToken(String token) =>
      defaultHeaders["Authorization"] = "Bearer $token";

  Future<bool> checkImage({
    required String url,
  }) async {
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<NetworkMsg> get(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams}) async {
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    log(http.options.baseUrl);

    var response = await http.get(url,
        queryParameters: queryParams,
        options: Options(headers: defaultHeaders));

    return responseHandler(response);
  }

  Future<NetworkMsg> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }
    MapEntry<String, MultipartFile>? file;
    if (body["file"] != null && body["file"] != "" && body["file"] != "/") {
      log(body["file"].toString());
      file = MapEntry<String, MultipartFile>(
          "file", await MultipartFile.fromFile(body["file"]));
    }

    FormData data = FormData.fromMap(body);
    if (file != null) {
      data.files.add(file);
    }
    Response response = await http.post(
      url,
      data: data,
      options: Options(headers: defaultHeaders),
    );

    return responseHandler(response);
  }

  Future<NetworkMsg> postJson({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    headers!.addAll(defaultHeaders);
    headers.remove("Content-Type");
    headers.addAll({"Content-Type": "application/json"});

    log(headers.toString());

    Response response = await http.post(
      url,
      data: body,
      options: Options(headers: headers),
    );

    return responseHandler(response);
  }

  Future<NetworkMsg> put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    // MapEntry<String, MultipartFile>? file;
    // if (body["file"] != null) {
    //   file = MapEntry<String, MultipartFile>(
    //       "file", await MultipartFile.fromFile(body["file"]));
    // }

    // FormData data = FormData.fromMap(body);
    // if (file != null) {
    //   data.files.add(file);
    // }

    var response = await http.put(
      url,
      data: body,
      queryParameters: queryParams,
      options: Options(
        headers: defaultHeaders,
      ),
    );

    return responseHandler(response);
  }

  Future<NetworkMsg> delete(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams}) async {
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }
    var response = await http.delete(url,
        queryParameters: queryParams,
        options: Options(headers: defaultHeaders));

    return responseHandler(response);
  }
}

NetworkMsg responseHandler(Response response) {
  if (response.statusCode == 200) {
    List<String?> message = List<String>.from(response.data["message"]);

    return NetworkMsg(
        success: true,
        data: response.data,
        code: response.statusCode!,
        message: message,
        codeMessage: response.statusMessage!);
  } else {
    List<String?> message = [];

    try {
      log(response.data.toString());
      message = List<String>.from(response.data["message"]);
      return NetworkMsg(
          success: false,
          data: response.data,
          message: message,
          code: response.statusCode!,
          codeMessage: response.statusMessage!);
    } catch (e) {
      log("Unable to parse message", name: "Network");
      message.add("[${response.statusCode}]: ${response.statusMessage}");
      return NetworkMsg(
          success: false,
          data: response.data,
          message: message,
          code: response.statusCode!,
          codeMessage: response.statusMessage!);
    }
  }
}

class NetworkMsg {
  final bool success;
  final dynamic data;
  final List<String?> message;
  final int code;
  final String codeMessage;

  NetworkMsg({
    required this.message,
    required this.success,
    required this.data,
    required this.code,
    required this.codeMessage,
  });
}
