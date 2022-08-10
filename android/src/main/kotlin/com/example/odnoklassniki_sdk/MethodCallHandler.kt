package com.example.odnoklassniki_sdk

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import ru.ok.android.sdk.Odnoklassniki
import ru.ok.android.sdk.util.OkAuthType
import ru.ok.android.sdk.util.OkScope
import com.example.odnoklassniki_sdk.OdnoklassnikiSdkPlugin.Companion.okLoginManager

class MethodCallHandler(
    private val callback: LoginCallback
) : MethodChannel.MethodCallHandler {

    companion object {
        private const val logIn = "logIn"
    }

    private var activity: Activity? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        activity?.let {
            when (call.method) {
                logIn -> {
                    callback.addPending(result)
                    okLoginManager = Odnoklassniki.createInstance(
                        activity!!.applicationContext,
                        getResourceFromContext(activity!!.applicationContext, "ok_app_id"),
                        getResourceFromContext(activity!!.applicationContext, "ok_app_key")
                    )

                    okLoginManager!!.requestAuthorization(
                        activity!!,
                        getResourceFromContext(activity!!.applicationContext, "ok_redirect_url"),
                        OkAuthType.WEBVIEW_OAUTH,
                        OkScope.VALUABLE_ACCESS
                    )
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getResourceFromContext(context: Context, resName: String): String {
        val stringRes = context.resources.getIdentifier(resName, "string", context.packageName)
        if (stringRes == 0) {
            throw IllegalArgumentException(
                String.format(
                    "The 'R.string.%s' value it's not defined in your project's resources file.",
                    resName
                )
            )
        }
        return context.getString(stringRes)
    }

    fun updateActivity(activity: Activity?) {
        this.activity = activity
    }
}