import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eakazijobs/models/responseModel.dart';
import 'package:eakazijobs/services/getStates.dart';
import 'package:eakazijobs/services/localStorage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

LocalStorage localStorage = LocalStorage();

class HttpInstance {
  HttpInstance._();

  static final instance = HttpInstance._();

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "charset": "utf-8",
    "x-auth-token": ""
  };

  Future getData({required String path}) async {
    var token = await localStorage.getData(name: 'token');
    headers['x-auth-token'] = "$token";

    try {
      Future<http.Response> apiResponse =
          http.get(Uri.parse(path), headers: headers);
      http.Response response = await apiResponse;
      print('api $path');
      print('response ${response.body}');

      if (response.statusCode == 404) {
        throw ResponseModel.fromJson({"error": 'Route not found'});
      }
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      return jsonDecode(response.body);
    } on SocketException catch (_) {
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;

      print('errr ${e.toString()} ');
      throw error.error ?? 'error occured';
    }
  }

  Future postData(String path, data) async {
    var token = await localStorage.getData(name: 'token');
    headers['x-auth-token'] = "$token";

    Controller c = Get.put(Controller());
    try {
      c.change(true);
      Future<http.Response> apiResponse = http.post(
        Uri.parse(path),
        body: jsonEncode(data),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');
      print('api body ${jsonEncode(data)}');

      print('response ${response.body}');
      c.change(false);
      if (response.statusCode == 404) {
        c.change(false);
        throw ResponseModel.fromJson({"error": 'Route not found'});
      }

      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        print('here');
        throw decodedData;
      }
      return decodedData.result ?? decodedData.message;
    } on SocketException catch (_) {
      c.change(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.change(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.change(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.change(false);
      print('errr ${e.toString()} ');
      throw error.message ?? 'error occured';
    }
  }

  Future patchData(String path, data) async {
    var token = await localStorage.getData(name: 'token');
    headers['x-auth-token'] = "$token";

    Controller c = Get.put(Controller());
    try {
      c.change(true);
      Future<http.Response> apiResponse = http.patch(
        Uri.parse(path),
        body: jsonEncode(data),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');
      print('api body ${jsonEncode(data)}');

      print('response ${response.body}');
      c.change(false);
      if (response.statusCode == 404) {
        c.change(false);
        throw ResponseModel.fromJson({"error": 'Route not found'});
      }
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        print('here');
        throw decodedData;
      }
      return decodedData.result ?? decodedData.message;
    } on SocketException catch (_) {
      c.change(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.change(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.change(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.change(false);
      print('errr ${e.toString()} ');
      throw error.error ?? 'error occured';
    }
  }

  Future putData(String path, data) async {
    var token = await localStorage.getData(name: 'token');
    headers['x-auth-token'] = "$token";

    Controller c = Get.put(Controller());
    try {
      c.change(true);
      Future<http.Response> apiResponse = http.put(
        Uri.parse(path),
        body: jsonEncode(data),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');
      print('api body ${jsonEncode(data)}');

      print('response ${response.body}');
      c.change(false);
      if (response.statusCode == 404) {
        c.change(false);
        throw ResponseModel.fromJson({"error": 'Route not found'});
      }
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw decodedData;
      }
      return decodedData.result ?? decodedData.message;
    } on SocketException catch (_) {
      c.change(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.change(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.change(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.change(false);
      print('errr ${e.toString()} ');
      throw error.error ?? 'error occured';
    }
  }

  Future deleteData(String path) async {
    var token = await localStorage.getData(name: 'token');
    headers['x-auth-token'] = "$token";

    Controller c = Get.put(Controller());
    try {
      c.change(true);
      Future<http.Response> apiResponse = http.delete(
        Uri.parse(path),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');

      print('response ${response.body}');
      c.change(false);
      if (response.statusCode == 404) {
        c.change(false);
        throw ResponseModel.fromJson({"error": 'Route not found'});
      }
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw decodedData;
      }
      return decodedData.result ?? decodedData.message;
    } on SocketException catch (_) {
      c.change(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.change(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.change(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.change(false);

      throw error.error ?? 'error occured';
    }
  }
}
