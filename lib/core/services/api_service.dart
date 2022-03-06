import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as inner;
import 'package:moni/core/models/service_response.dart';
import 'package:moni/core/utils/utilities.dart';

class ApiService {
  int timeOutDurationInSeconds = 30;
  String timeOutText =
      "The operation couldn't be completed. Check your internet settings";

  Future<ServiceResponse> post(
      {var body, required var url, String? token}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    if (token != null) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => "Bearer $token");
    }

    try {
      final inner.IOClient _client = getClient();

      http.Response response;

      if (body == null) {
        response = await _client
            .post(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: timeOutDurationInSeconds));
      } else {
        response = await _client
            .post(Uri.parse(url), headers: headers, body: json.encode(body))
            .timeout(Duration(seconds: timeOutDurationInSeconds));
      }

      _client.close();
      return Utilities.parseResponse(response);
    } on TimeoutException catch (e) {
      return ServiceResponse(hasError: true, message: timeOutText);
    } catch (e) {
      return ServiceResponse(
          hasError: true, message: "Error connecting to the server");
    }
  }

  Future<ServiceResponse> get({required String url, String? token}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => "Bearer $token");
    }
    try {
      final inner.IOClient _client = getClient();
      http.Response response = await _client
          .get(Uri.parse(url), headers: headers)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      _client.close();
      return Utilities.parseResponse(response);
    } on TimeoutException catch (e) {
      return ServiceResponse(hasError: true, message: timeOutText);
    } catch (e) {
      return ServiceResponse(
          hasError: true, message: "Error connecting to the server");
    }
  }

  Future<ServiceResponse> put(
      {var body, required String url, String? token}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => "Bearer $token");
    }

    try {
      final inner.IOClient _client = getClient();

      http.Response response = await _client
          .put(Uri.parse(url), headers: headers, body: json.encode(body))
          .timeout(Duration(seconds: timeOutDurationInSeconds));

      _client.close();
      return Utilities.parseResponse(response);
    } on TimeoutException catch (e) {
      return ServiceResponse(hasError: true, message: timeOutText);
    } catch (e) {
      return ServiceResponse(
          hasError: true, message: "Error connecting to the server");
    }
  }

  Future<ServiceResponse> delete(
      {required String url, var body, String? token}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => "Bearer $token");
    }

    try {
      final inner.IOClient _client = getClient();
      http.Response response = await _client
          .delete(Uri.parse(url), headers: headers, body: json.encode(body))
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      _client.close();
      return Utilities.parseResponse(response);
    } on TimeoutException catch (e) {
      return ServiceResponse(hasError: true, message: timeOutText);
    } catch (e) {
      return ServiceResponse(
          hasError: true, message: "Error connecting to the server");
    }
  }

  inner.IOClient getClient() {
    bool trustSelfSigned = true;
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    inner.IOClient ioClient = inner.IOClient(httpClient);
    return ioClient;
  }
}
