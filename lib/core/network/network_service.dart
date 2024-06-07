import 'dart:convert';
import 'package:http/http.dart' as http;
import 'custom_response_model.dart';

class NetworkService {
  final String baseUrl;

  NetworkService({required this.baseUrl});

  // Method to handle GET requests
  Future<CustomResponseModel> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url);
      return _handleResponse(response);
    } catch (error) {
      return CustomResponseModel(
        data: null,
        isSuccess: false,
        message: 'Failed to GET data: $error',
        statusCode: null,
      );
    }
  }

  // Method to handle POST requests
  Future<CustomResponseModel> post(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } catch (error) {
      return CustomResponseModel(
        data: null,
        isSuccess: false,
        message: 'Failed to POST data: $error',
        statusCode: null,
      );
    }
  }

  // Private method to handle HTTP response
  CustomResponseModel _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return CustomResponseModel(
        data: jsonDecode(response.body),
        isSuccess: true,
        statusCode: response.statusCode,
      );
    } else {
      return CustomResponseModel(
        data: null,
        isSuccess: false,
        message: 'HTTP error: ${response.statusCode}, ${response.body}',
        statusCode: response.statusCode,
      );
    }
  }
}
