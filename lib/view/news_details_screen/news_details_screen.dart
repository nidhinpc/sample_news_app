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
    if (widget.saved != null) {
      SavedNewsScreen(
        saved: widget.saved,
      );
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
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
            debugPrint('Navigation request: ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final articlesList = context.watch<HomeScreenController>().articlesList;
    final String? weburl = (articlesList != null &&
            widget.index < articlesList.length &&
            articlesList[widget.index].url != null)
        ? articlesList[widget.index].url
        : null;

    if (weburl == null || weburl.isEmpty) {
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
      body: WebViewWidget(controller: _controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
