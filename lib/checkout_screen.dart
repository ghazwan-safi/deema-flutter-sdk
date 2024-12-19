import 'package:deema_sdk/deema_webview.dart';
import 'package:deema_sdk/purchase_result.dart';
import 'package:deema_sdk/services/purchase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/purchase_cubit.dart';
import 'cubit/purchase_state.dart';
import 'models/purchase_request.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    Key? key,
    required this.purchaseRequest,
  }) : super(key: key);

  final PurchaseRequest purchaseRequest;

  @override
  Widget build(BuildContext context) {
    final purchaseService = context.read<PurchaseService>();
    return BlocProvider(
      create: (context) => PurchaseCubit(purchaseService)..createPurchase(purchaseRequest),
      child: PopScope(
        canPop: true,
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: BlocConsumer<PurchaseCubit, PurchaseState>(
                listener: (context, state) {
                  if (state is PurchaseFailure) {
                    Navigator.pop(context, Failure(state.error));
                  }
                },
                builder: (context, state) {
                  if (state is PurchaseLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is PurchaseSuccess) {
                    return DeemaWebView(
                      webUrl: state.response.data.redirectLink,
                      onResult: (result) {
                        print("11111");
                        Navigator.pop(context, result);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
