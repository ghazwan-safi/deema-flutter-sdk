import 'package:deema_sdk/deema_sdk.dart';
import 'package:flutter/foundation.dart';
import '../models/purchase_request.dart';
import '../models/purchase_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PurchaseService {
  final String _secretKey;
  late final Map<String, String> _headers;
  late final Environment _env;

  PurchaseService(this._secretKey, this._env){
    _headers = {
      'Authorization': 'Basic $_secretKey',
      'Content-Type': 'application/json',
      'source': 'sdk',
    };
  }

  Future<PurchaseResponse> createPurchase(PurchaseRequest request) async {
    late final String baseUrl;
    switch (_env) {

      case Environment.sandbox:
        baseUrl = 'https://sandbox-api.deema.me';
        break;
      case Environment.production:
        baseUrl = 'https://api.deema.me';
        break;
    }

    final requestUrl = '$baseUrl/api/merchant/v1/purchase';

    try {
      final response = await http
          .post(
        Uri.parse(requestUrl),
        headers: _headers,
        body: jsonEncode(request.toJson()),
      );

      debugPrint('Request: POST $requestUrl');
      debugPrint('Request Headers: $_headers');
      debugPrint('Request Body: ${jsonEncode(request.toJson())}');

      if (response.statusCode == 200) {
        debugPrint('Response Body: ${response.body}');
        return PurchaseResponse.fromJson(jsonDecode(response.body));
      } else {
        debugPrint('Failed to create purchase. Status Code: ${response.statusCode}');
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      debugPrint('Error creating purchase: $e');
      throw Exception('Error creating purchase: $e');
    }
  }
}
