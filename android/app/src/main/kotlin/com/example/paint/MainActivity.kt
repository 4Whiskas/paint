package com.example.paint

import androidx.annotation.NonNull
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterFragmentActivity
import android.view.WindowManager.LayoutParams;



class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    getWindow().addFlags(LayoutParams.FLAG_SECURE);
    super.configureFlutterEngine(flutterEngine)
  }
}
