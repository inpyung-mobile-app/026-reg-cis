
package com.example.test_1

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    // Dart에서 show를 부르면 안드로이드 Toast를 띄우는 채널
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "toast").setMethodCallHandler { call, result ->
            if (call.method == "show") {
                Toast.makeText(this, call.arguments as String, Toast.LENGTH_SHORT).show()
                result.success(null)
            }
        }
    }
}