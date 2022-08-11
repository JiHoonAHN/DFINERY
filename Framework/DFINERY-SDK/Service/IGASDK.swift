import Foundation
import Combine

public final class IGASDK{
    public static let shared = IGASDK()
    
    //MARK: - Properties
    private let loggingSystem = LoggingSystem()
    
    private var appKey : String = .init()
    private var userProperties: [String: Any]? = .init()
    private var identity: UserIdentity
    private var location : UserLocation?
    
    //MARK: - init
    public init(){
        self.identity = UserIdentity()
    }
    
    //MARK: - Method
    //init
    public func `init`(appkey : String){
        self.appKey = appkey
    }
    //setUserProperty
    public func setUserProperty(_ keyValue : [String : Any]?){
        self.userProperties = keyValue
    }
    //addEvent
    public func addEvent(_ eventName : String,_ keyValue : [String : Any]){
        loggingSystem.system(
            appKey: self.appKey,
            event: eventName,
            param: keyValue,
            userProperties: self.userProperties,
            identity: self.identity,
            location: self.location
        )
    }
    //setLocation
    public func setLocation(lat : Double, lng : Double){
        self.location?.lat = lat
        self.location?.lng = lng
    }
}
