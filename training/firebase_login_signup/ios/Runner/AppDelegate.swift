import UIKit
import Flutter
import GoogleSignIn

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Add this line to initialize the Google Sign-In plugin.
    GIDSignIn.sharedInstance().clientID = "YOUR_CLIENT_ID"
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
