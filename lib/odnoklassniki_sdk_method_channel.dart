import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'odnoklassniki_sdk_platform_interface.dart';

/// An implementation of [OdnoklassnikiSdkPlatform] that uses method channels.
class MethodChannelOdnoklassnikiSdk extends OdnoklassnikiSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('odnoklassniki_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
