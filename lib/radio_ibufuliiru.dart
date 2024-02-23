// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

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
  const RadioIbufuliiru({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RadioIbufuliiruState createState() => _RadioIbufuliiruState();
}

class _RadioIbufuliiruState extends State<RadioIbufuliiru> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Radio Ibufuliiru'),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
          actions: const <Widget>[],
        ),
        body: const Center(
          child: Text('Radio Ibufuliiru :  Tulonge imyazi mu Kifuliiru.'),
        ));
  }
}
