import 'package:flutter/services.dart';

class OdnoklassnikiSdk {
  static const MethodChannel _channel = MethodChannel('odnoklassniki_sdk');

  static Future<OkToken> login() async {
    try{
      final response = await _channel.invokeMethod('logIn');
      return OkToken(response['access_token'], response['secret']);
    }on PlatformException {
      rethrow;
    }
  }

}

class OkToken {
  final String token;
  final String secret;

  OkToken(this.token, this.secret);
}
