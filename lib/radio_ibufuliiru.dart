// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Radio Ibufuliiru</title></head>
<body>
<p>
Muyegerere. Tuyuvwirize imyazi ye mwitu mu Kifuliiru
</p>
<iframe src="//www.zeno.fm/player/radio-ibufuliiru" width="575" height="240" frameborder="0" scrolling="no"></iframe><a href="https://www.zeno.fm" target="_blank" style="display: block; font-size: 0.9em; line-height: 10px;">A Zeno Media Station</a>
</body>
</html>
''';

class RadioIbufuliiru extends StatefulWidget {
  @override
  _RadioIbufuliiruState createState() => _RadioIbufuliiruState();
}

class _RadioIbufuliiruState extends State<RadioIbufuliiru> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Ibufuliiru'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl:
              'https://ibufuliiru.editorx.io/ibufuliiru/radio-ibufuliiru',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          // ignore: prefer_collection_literals

          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://www.youtube.com/channel/UCVtQ55IRvmdR4T3dNbibjlA')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
