import 'package:flutter/services.dart';

class OdnoklassnikiSdk {
  static const MethodChannel _channel = MethodChannel('odnoklassniki_sdk');

  static Future<OkToken> login() async {
    final response = await _channel.invokeMethod('logIn');
    return OkToken(response['access_token'], response['secret']);
  }

}

class OkToken {
  final String token;
  final String secret;

  OkToken(this.token, this.secret);
}
