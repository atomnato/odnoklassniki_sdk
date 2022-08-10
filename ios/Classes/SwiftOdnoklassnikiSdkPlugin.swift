import Flutter
import UIKit

enum PluginMethod: String {
    case
}
public class SwiftOdnoklassnikiSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "odnoklassniki_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftOdnoklassnikiSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
