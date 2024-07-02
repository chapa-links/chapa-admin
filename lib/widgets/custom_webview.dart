// import 'dart:async';

// import 'package:evolve_user/widgets/__widgets.dart';
// import 'package:evolve_user/widgets/appbar2.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class CustomWebview extends StatefulWidget {
//   const CustomWebview({required this.pageUrl, super.key});
//   final String pageUrl;

//   @override
//   State<CustomWebview> createState() => _CustomWebviewState();
// }

// class _CustomWebviewState extends State<CustomWebview> {
//   bool isLoading = true;
//   int progressIndicator = 0;
//   final webViewController = Completer<WebViewController>();

//   JavascriptChannel toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: "Toaster", onMessageReceived: (JavascriptMessage message) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseScaffold(
//       safeTop: false,
//       builder: (x) => Column(
//         children: [
//           CustomAppBar2(),
//           Expanded(
//             child: Stack(
//               children: [
//                 WebView(
//                   initialUrl: widget.pageUrl,
//                   javascriptChannels: {toasterJavascriptChannel(context)},
//                   javascriptMode: JavascriptMode.unrestricted,
//                   gestureNavigationEnabled: true,
//                   onPageFinished: (url) => setState(() {
//                     isLoading = false;
//                   }),
//                   onPageStarted: (url) => setState(() {
//                     isLoading = true;
//                   }),
//                   onWebViewCreated: (controller) {
//                     setState(() {
//                       isLoading = false;
//                       webViewController.complete(controller);
//                     });
//                   },
//                 ),
//                 Visibility(
//                   visible: isLoading,
//                   child: PageLoader(
//                       message:
//                           "Setting up your payment portal.\n Will take just a moment👌..."),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
