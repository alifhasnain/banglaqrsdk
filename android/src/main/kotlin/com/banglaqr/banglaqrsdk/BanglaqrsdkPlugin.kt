package com.banglaqr.banglaqrsdk

import android.content.Context
import android.util.Log
import com.google.gson.Gson
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
    private lateinit var result: Result

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "banglaqr")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        this.result = result
        when (call.method) {


            "initializeBanglaQRSdk" -> {
                Log.d("initializeBanglaQRSdk", "Initializing BanglaQR SDK")
                val args = call.arguments as? Map<*, *>
                if (args != null) {
                    val primaryColorCode: String = args["primaryColorCode"].toString()
                    val secondaryColorCode: String = args["secondaryColorCode"].toString()

                    val banglaQR = BanglaQRInitialization(
                        BanglaQRFundingSource.FundingSource.VISA,
                        primaryColorCode,
                        secondaryColorCode,
                    )

                    IntegrateBanglaQR.getInstance(this.context).addBanglaQRInitialization(banglaQR)
                        .build(this)
                }

            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun banglaQRFailResponse(failResponse: String) {
        this.result.error("0", failResponse, null)
        //  this.result.success(failResponse)
    }

    override fun banglaQRSuccessResponse(qrResponse: QRResponse) {
        this.result.success(Gson().toJson(qrResponse))
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

