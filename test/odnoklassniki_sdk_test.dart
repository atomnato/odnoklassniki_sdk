import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odnoklassniki_sdk/odnoklassniki_sdk_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOdnoklassnikiSdkPlatform 
    with MockPlatformInterfaceMixin
    implements OdnoklassnikiSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  const MethodChannel channel = MethodChannel('odnoklassniki_sdk');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
