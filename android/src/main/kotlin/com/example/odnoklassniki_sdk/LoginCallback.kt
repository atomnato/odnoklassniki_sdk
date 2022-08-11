package com.example.odnoklassniki_sdk

import io.flutter.plugin.common.MethodChannel
import org.json.JSONException
import org.json.JSONObject
import ru.ok.android.sdk.OkListener

class LoginCallback: OkListener {
    private var methodResult: MethodChannel.Result? = null

    override fun onError(error: String?) {
        methodResult?.error("UNAVAILABLE", "OK login error", null)
        methodResult = null
    }

    fun addPending(result: MethodChannel.Result) {
        if (methodResult != null) {
            return
        }
        methodResult = result
    }

    override fun onSuccess(json: JSONObject) {
        try {
            println(json)
            val token = json.getString("access_token")
            val secretKey = json.getString("session_secret_key")
            val expires_in = json.getString("expires_in")
            val hashmap = HashMap<String, String>()
            hashmap["access_token"] = token
            hashmap["secret"] = secretKey
            hashmap["expires_in"] = expires_in
            methodResult?.success(hashmap)
            methodResult = null

        } catch (exception: JSONException) {
            methodResult = null
            onError(exception.localizedMessage)
        }

    }
}