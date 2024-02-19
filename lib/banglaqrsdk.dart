import 'dart:convert';

import 'package:banglaqrsdk/banglaqrsdk_platform_interface.dart';
import 'package:flutter/services.dart';

import 'model/bangla_qr_success_response.dart';

class Banglaqr {
  Future<void> initializeBanglaQRSdk(
      {required String primaryColorCode,
      required String secondaryColorCode,
      required Function(BanglaQrSuccessResponse response) onSuccess,
      required Function(String error) onError}) async {
    try {
      await BanglaqrsdkPlatform.instance
          .initializeBanglaQRSdk(
        primaryColorCode: primaryColorCode,
        secondaryColorCode: secondaryColorCode,
      )
          .then((response) {
        if (response != null) {
          onSuccess(BanglaQrSuccessResponse.fromJson(jsonDecode(response)));
        }
      });
    } on PlatformException catch (e) {
      if (e.message != null) {
        onError(e.message!);
      }
    }
  }
}
