import '/constants.dart';
import '/purchase_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef DeemaPurchaseCallBack = Function(PurchaseResult);

final settings = InAppWebViewSettings(
  applePayAPIEnabled: true,
  useOnNavigationResponse: true,
);

class DeemaWebView extends StatefulWidget {
  const DeemaWebView({super.key, required this.webUrl, required this.onResult});

  final String webUrl;
  final DeemaPurchaseCallBack onResult;

  @override
  State<DeemaWebView> createState() => _DeemaWebViewState();
}

class _DeemaWebViewState extends State<DeemaWebView> {
  final GlobalKey webViewKey = GlobalKey();

  final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  void initState() {
    super.initState();
    controller.loadRequest(Uri.parse(widget.webUrl));
    controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          final nextUrl = request.url;
          if (nextUrl.contains(DeemaSDKConstants.failureUrl)) {
            widget.onResult(Failure(''));
            return NavigationDecision.prevent;
          }
          if (nextUrl.contains(DeemaSDKConstants.successUrl)) {
            widget.onResult(Success());
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: WebViewWidget(controller: controller),
        ),
      ],
    );
  }
}

void onResultHandler({
  required DeemaPurchaseCallBack resultCallBack,
  required String nextUrl,
}) {
  if (nextUrl.contains(DeemaSDKConstants.failureUrl)) {
    resultCallBack(Failure(''));
  }
  if (nextUrl.contains(DeemaSDKConstants.successUrl)) {
    resultCallBack(Success());
  }
}

NavigationResponseAction navigationResponseHandler({
  required String nextUrl,
}) {
  if (nextUrl.contains(DeemaSDKConstants.failureUrl)) {
    return NavigationResponseAction.CANCEL;
  }
  if (nextUrl.contains(DeemaSDKConstants.successUrl)) {
    return NavigationResponseAction.CANCEL;
  }
  return NavigationResponseAction.ALLOW;
}
