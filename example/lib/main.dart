import 'package:deema_sdk/deema_sdk.dart';
import 'package:deema_sdk/models/purchase_request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text('Deema Purchase Example')), body: HomeView()),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controller,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            DeemaSdk.lunch(
              context,
              "sk_test_d5gntxxdoRNGkAweKjWZMr8iocXd3oNO1Wz5VJuW_65",
              Environment.sandbox,
              PurchaseRequest(
                merchantOrderId: "1726",
                amount: 100.0,
                currencyCode: "KWD",
              ),
                  (result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Deema purchase result: $result"),
                  ),
                );
              },
            );
          },
          child: const Text('Create Purchase'),
        ),
      ],
    );
  }
}
