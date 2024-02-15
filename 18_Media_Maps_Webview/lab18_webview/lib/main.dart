import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final localhostServer = InAppLocalhostServer(documentRoot: 'assets');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  if (!kIsWeb) {
    await localhostServer.start();
  }
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  InAppWebViewController? _webViewController;
  InAppWebViewSettings? _settings;
  TextEditingController? _urlText;

  @override
  void initState() {
    super.initState();
    _urlText = TextEditingController(text: 'https://github.com');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Lab #18.4 - Webview'),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          if (_webViewController != null) {
                            if (await _webViewController!.canGoBack()) {
                              _webViewController!.goBack();
                            }
                          }
                        },
                        icon: const Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () async {
                          if (_webViewController != null) {
                            if (await _webViewController!.canGoForward()) {
                              _webViewController!.goForward();
                            }
                          }
                        },
                        icon: const Icon(Icons.arrow_forward)),
                    IconButton(
                        onPressed: () => {
                              _webViewController!.loadUrl(
                                  urlRequest: URLRequest(
                                url: WebUri(_urlText!.text),
                              ))
                            },
                        icon: const Icon(Icons.refresh)),
                    Expanded(
                      child: TextFormField(
                        controller: _urlText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter url',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: InAppWebView(
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    initialSettings: _settings,
                    initialUrlRequest: URLRequest(
                      url: WebUri('https://skillbox.ru'),
                    ),
                  ),
                )
              ],
            )));
  }

  @override
  void dispose() {
    _webViewController?.dispose();
    super.dispose();
  }
}
