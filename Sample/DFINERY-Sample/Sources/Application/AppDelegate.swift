import UIKit
import CoreLocation
import AppTrackingTransparency
import AdSupport

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locationSetting()
        requestTrackingSetting()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    //MARK: - Method
    private func locationSetting(){
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
    }
    private func requestTrackingSetting(){
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status{
            case .authorized:
                break
            case .notDetermined,.restricted, .denied:
                break
            @unknown default:
                break
            }
        }
    }
    
}
//MARK: - CLLocation
extension AppDelegate : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription) // error 나면 message 받음
    }
    
    // 기존 locationManager(didChangeAuthorization:_)이 iOS 14 부터 deprecated 됨
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS Setting Complete")
        case .notDetermined:
            print("GPS notDetermined")
        case .restricted:
            print("GPS resitricted")
        case .denied:
            print("GPS denied")
        default:
            print("GPS Default")
        }
    }
    
}

