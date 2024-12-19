# Deema BNPL SDK for Flutter

## Introduction

The **Deema SDK** for Flutter allows you to seamlessly integrate our Buy Now, Pay Later (BNPL) payment service into your Flutter applications. The SDK simplifies initiating payment flows, managing transactions, and handling result statuses with structured responses.

---

## Installation

Add the **Deema SDK** to your Flutter project by including it in your `pubspec.yaml`:

```yaml
dependencies:
  deema_sdk: ^1.0.0
```

Run the following command to install the package:

```bash
flutter pub get
```

---

## Quick Start

### Step 1: Import the SDK

```dart
import 'package:deema_sdk/deema_sdk.dart';
```

### Step 2: Launch the SDK

Use the `DeemaSdk.launch` method to initiate the payment flow:

```dart
DeemaSdk.launch(
context,
"SDK_KEY",
Environment.sandbox,
PurchaseRequest(
merchantOrderId: "1726",
amount: 100.0,
currencyCode: "KWD",
),
(result) {
if (result is Success) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Payment successful!")),
);
} else if (result is Failure) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Payment failed: ${result.message}")),
);
} else if (result is Canceled) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Payment was canceled")),
);
} else if (result is Unknown) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Unknown payment result")),
);
}
},
);
```

---

## Example Integration

Here’s a complete example integrating the **Deema SDK** into a Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:deema_sdk/deema_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deema Payment Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void _makePurchase(BuildContext context) {
    DeemaSdk.launch(
      context,
      "SDK_KEY",
      Environment.sandbox,
      PurchaseRequest(
        merchantOrderId: "1726",
        amount: 100.0,
        currencyCode: "KWD",
      ),
              (result) {
        if (result is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Payment successful!")),
          );
        } else if (result is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Payment failed: ${result.message}")),
          );
        } else if (result is Canceled) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Payment was canceled")),
          );
        } else if (result is Unknown) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Unknown payment result")),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deema Payment")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _makePurchase(context),
          child: const Text("Pay Now"),
        ),
      ),
    );
  }
}
```

---

## API Reference

### Classes

#### `DeemaSdk`
- **`launch`**: Initiates the payment flow.
  - **Parameters**:
    - `SDK_Key`: `String` (required) - The SDK key provided by Deema for authentication.
    - `environment`: `Environment` (required) - The environment for the transaction (`sandbox` or `production`).
    - `context`: `BuildContext` (required) - The current widget context.
    - `request`: `PurchaseRequest` (required) - Details of the purchase.
    - `callback`: `Function(PurchaseResult result)` (required) - Callback to handle the result of the payment.

#### `PurchaseRequest`
- Represents the payment details.
  - **Fields**:
    - `merchantOrderId`: `String` (required) - Unique identifier for the merchant order.
    - `amount`: `double` (required) - The purchase amount.
    - `currencyCode`: `String` (required) - The currency code ("KWD" or "BHD").

### Result Classes

#### `PurchaseResult`
The parent class for all result types. Subclasses include:
- **`Success`**: Indicates a successful payment.
- **`Failure`**: Indicates a payment failure.
  - **Field**: `message` (String) - Describes the reason for failure.
- **`Canceled`**: Indicates the user canceled the payment.
- **`Unknown`**: Represents an unknown error or status.
