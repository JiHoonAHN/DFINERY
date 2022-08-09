import CoreTelephony
import Network
import UIKit

final class RequestClient : RequestEvent{
    //MARK: - Properties
    private let networkMonitoring : NWPathMonitor // "network": "wifi", 부분 때문에 Network를 사용하였습니다.
    private let deviceInfo : UIDevice
    private let resolution : UIScreen
    private let carrier : [String: CTCarrier]?
    private let language: [String]

    //MARK: - Initalizer
    init(
        networkMonitoring : NWPathMonitor,
        deviceInfo : UIDevice = .current,
        resolution : UIScreen = .main,
        carrier : [String: CTCarrier]? = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders,
        language : [String] = NSLocale.preferredLanguages
    ){
        self.networkMonitoring = networkMonitoring
        self.deviceInfo = deviceInfo
        self.resolution = resolution
        self.carrier = carrier
        self.language = language
        networkMonitoring.start(queue: .global())
    }
    
    //MARK: - Deinit
    deinit{ self.networkMonitoring.cancel() }
    
    //MARK: - Method
    func requestBody(
        appKey: String,
        event: String,
        param: [String : Any]?,
        userProperties: [String : Any]?,
        identity: UserIdentity,
        location: UserLocation?
    ) -> Data? {
        let a : [String: Any] = [:]
        
        return Data()
    }
    
}
