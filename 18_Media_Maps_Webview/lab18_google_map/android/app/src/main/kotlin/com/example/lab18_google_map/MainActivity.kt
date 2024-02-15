package com.example.lab18_google_map

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("23a2fe96-75d1-409b-971a-423808ea58f6")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}