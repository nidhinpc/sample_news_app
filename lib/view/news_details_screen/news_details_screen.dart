import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sample_news_app/controller/home_screen_controller.dart';
import 'package:sample_news_app/model/home_screen_model.dart';
import 'package:sample_news_app/view/saved_news_screen/saved_news_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatefulWidget {
  final int index;
  final List<Article>? saved;
  const NewsDetailsScreen({required this.index, this.saved, Key? key})
      : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading progress if needed
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            // Allow navigation unless explicitly restricted
            debugPrint('Navigation request: ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final articlesList =
        context.watch<HomeScreenController>().articlesList; // Safer access
    final String? weburl = (articlesList != null &&
            widget.index < articlesList.length &&
            articlesList[widget.index].url != null)
        ? articlesList[widget.index].url
        : null;

    if (weburl == null || weburl.isEmpty) {
      // Show error if URL is not available
      return Scaffold(
        appBar: AppBar(title: const Text('News Details')),
        body: const Center(
          child: Text('Invalid or missing URL.'),
        ),
      );
    }

    // Load the URL
    _controller.loadRequest(Uri.parse(weburl));

    return Scaffold(
      appBar: AppBar(title: const Text('News Details')),
      body: Column(
        children: [
          WebViewWidget(controller: _controller),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedNewsScreen(
                      saved: widget.saved,
                    ),
                  ));
            },
            child: SizedBox(
              height: 5,
              width: 5,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
