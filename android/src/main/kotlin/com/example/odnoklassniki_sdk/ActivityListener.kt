package com.example.odnoklassniki_sdk

import android.content.Intent
import io.flutter.plugin.common.PluginRegistry
import com.example.odnoklassniki_sdk.OdnoklassnikiSdkPlugin.Companion.okLoginManager

class ActivityListener(
    private val callback: LoginCallback,
) : PluginRegistry.ActivityResultListener {
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (okLoginManager != null) {
            return okLoginManager!!.onAuthActivityResult(
                requestCode,
                resultCode,
                data,
                callback
            )
        }
        return false
    }
}