import 'package:deema_sdk/checkout_screen.dart';
import 'package:deema_sdk/deema_webview.dart';
import 'package:deema_sdk/purchase_result.dart';
import 'package:deema_sdk/services/purchase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/purchase_request.dart';

enum Environment { sandbox, production }

class DeemaSdk {
  static lunch(
    BuildContext context,
    String secretKey,
    Environment env,
    PurchaseRequest request,
    DeemaPurchaseCallBack onResult,
  ) async {
    if (secretKey.isEmpty) {
      throw Exception("Secret key can't be empty");
    }

    final purchaseService = PurchaseService(secretKey, env);

    final result = await Navigator.push<PurchaseResult>(
          context,
          MaterialPageRoute(
            builder: (context) => Provider(
              create: (BuildContext context) => purchaseService,
              child: CheckoutScreen(purchaseRequest: request),
            ),
          ),
        ) ??
        Canceled();

    onResult(result);
  }
}
