import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'odnoklassniki_sdk_method_channel.dart';

abstract class OdnoklassnikiSdkPlatform extends PlatformInterface {
  /// Constructs a OdnoklassnikiSdkPlatform.
  OdnoklassnikiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static OdnoklassnikiSdkPlatform _instance = MethodChannelOdnoklassnikiSdk();

  /// The default instance of [OdnoklassnikiSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelOdnoklassnikiSdk].
  static OdnoklassnikiSdkPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OdnoklassnikiSdkPlatform] when
  /// they register themselves.
  static set instance(OdnoklassnikiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
