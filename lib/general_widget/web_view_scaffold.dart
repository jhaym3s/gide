// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/general_widget/app_loader.dart';

class WebViewScaffold extends StatefulWidget {
  final String webLink;
  final String titile;

  const WebViewScaffold({
    super.key,
    required this.webLink,
    required this.titile,
  });

  @override
  State<WebViewScaffold> createState() => _WebViewScaffoldState();
}

class _WebViewScaffoldState extends State<WebViewScaffold> {
  late WebViewController controller;
  int loadingProgress = 0;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingProgress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            log('error: ${error.description}');
            errorToastMessage('Error: ${error.description}');
            Navigator.pop(context);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.webLink));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!Change this
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhite,
        elevation: 0,
        title: Text(widget.titile,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Colors.white, //AppColors.gray50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: loadingProgress == 100
                  ? WebViewWidget(
                      controller: controller,
                    )
                  : Center(
                      child: Transform.scale(
                        scale: 1.5,
                        child: const AppLoader(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
