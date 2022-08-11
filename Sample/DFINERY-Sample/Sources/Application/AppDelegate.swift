import UIKit
import CoreLocation
import AppTrackingTransparency
import AdSupport
import DFINERY_SDK

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let igasdk = IGASDK.shared
    private let locationManager : CLLocationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        requestlocationSetting()
        requestTrackingSetting()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    //MARK: - Method
    private func requestlocationSetting(){
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }

    private func requestTrackingSetting(){
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status{
            case .authorized:
                let adid = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                self.igasdk.startIDFA(adid: adid)
            case .notDetermined,.restricted, .denied:
                self.igasdk.cancelIDFA()
            @unknown default:
                self.igasdk.cancelIDFA()
            }
        }
    }
    
}
//MARK: - CLLocation
extension AppDelegate : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription) // error 나면 message 받음
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationSetting()
    }
    
    // 기존 locationManager(didChangeAuthorization:_)이 iOS 14 부터 deprecated 됨
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationSetting()
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
    
    //MARK: - Custom Method
    private func locationSetting(){
        guard let location = self.locationManager.location?.coordinate else { return }
        igasdk.setLocation(lat: location.latitude, lng: location.longitude)
    }
}

