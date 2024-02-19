package com.banglaqr.banglaqrsdk

import android.content.Context
import android.util.Log
import com.sslwireless.banglaqrsdk.model.BanglaQRInitialization
import com.sslwireless.banglaqrsdk.model.QRResponse
import com.sslwireless.banglaqrsdk.view.singleton.IntegrateBanglaQR
import com.sslwireless.banglaqrsdk.view.utils.BanglaQRFundingSource
import com.sslwireless.banglaqrsdk.viewmodel.listener.BanglaQRResponseListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** BanglaqrPlugin */
class BanglaqrsdkPlugin : FlutterPlugin, MethodCallHandler, BanglaQRResponseListener,
    ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "banglaqr")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
//      "getPlatformVersion" -> {
//        result.success("Android ${android.os.Build.VERSION.RELEASE}")
//      }
            "initializeBanglaQRSdk" -> {
                Log.d("initializeBanglaQRSdk", "Initializing BanglaQR SDK")
                val banglaQR = BanglaQRInitialization(
                    BanglaQRFundingSource.FundingSource.VISA,
                    "#6200EE",
                    "#03DAC6"
                )

                IntegrateBanglaQR.getInstance(this.context).addBanglaQRInitialization(banglaQR)
                    .build(this)
                result.success(true)
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun banglaQRFailResponse(failResponse: String) {
    }

    override fun banglaQRSuccessResponse(qrResponse: QRResponse) {
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        context = binding.activity
    }


    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        context = binding.activity
    }

    override fun onDetachedFromActivity() {
    }
}
