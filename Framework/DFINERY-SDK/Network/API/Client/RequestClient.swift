import CoreTelephony
import Network
import UIKit

final class RequestClient : RequestEvent{
    //MARK: - Properties
    private let networkMonitoring : NWPathMonitor // "network": "wifi", 부분 때문에 Network를 사용 사용하였습니다.
    private let deviceInfo : UIDevice // device의 상태
    private let resolution : UIScreen // resolution 때문에 사용
    private let carrier : [String: CTCarrier]? // 통신사 정보
    private let language: [String] //ko-kr 이런 식으로 구현됨

    //MARK: - Initalizer
    init(
        networkMonitoring : NWPathMonitor = NWPathMonitor(),
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
        location: UserLocation? // optional
    ) -> Data? {
        let dictionary : [String: Any] = [
            "evt" : [
                "created_at" : Date().usingDate(),
                "event" : event,
                "location" : [
                    "lat" : location?.lat,
                    "lng" : location?.lng
                ],
                "param" : param ?? [:]
            ],
            "common" : [
                "identity" : [
                    "adid" : identity.appleAdidIdentity,
                    "adid_opt_out" : identity.adidOptOut
                ],
                "device_info" : [
                    "os" : deviceInfo.systemVersion,
                    "model" : deviceInfo.model,
                    "resolution" : toResolution(),
                    "is_portrait" : deviceInfo.deviceIsPortrait(),
                    "platform" : "iOS",
                    "network" : networkMonitoring.statusString(),
                    "carrier" : toCarrier() ?? .init(),
                    "language" : toLanguageAndCountry()?.language ?? "",
                    "country" : toLanguageAndCountry()?.country ?? ""
                ],
                "package_name" : Bundle.main.bundleIdentifier ?? "",
                "appkey" : "appkey \(appKey)"
            ]
        ]
        print(dictionary)
        return Data().encoding(dictionary)
    }
}

//MARK: - Extension
extension RequestClient{
    //MARK: - Resolution
    private func toResolution() -> String{
        return "\(resolution.bounds.width)x\(resolution.bounds.height)"
    }
    
    //MARK: - Carrier
    private func toCarrier() -> String?{
         return self.carrier?.values
            .filter{ $0.carrierName != nil}
            .map{ $0.carrierName!}
            .joined(separator: "+")
    }
    
    //MARK: - language & country
    private func toLanguageAndCountry() -> (language: String, country : String)?{
        guard let languageAndCountry = self.language.first?.split(separator: "-") else {return nil}
        return (String(languageAndCountry[0]), "kr")
    }
    
}
