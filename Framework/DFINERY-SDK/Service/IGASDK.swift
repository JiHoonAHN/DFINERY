import Foundation
import Combine

public final class IGASDK{
    //MARK: - Cancellable
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: - Networking Properties
    let dispatcher = NetworkDispatcher()
    let api = APIClient()
    
    //MARK: - Properties
    private var appKey : String = .init()
    private var userProperties: [String: Any]? = .init()

    //MARK: - init
    public init(appKey: String = ""){
        self.appKey = appKey
    }

    //MARK: - Method
    public static func setUserProperty(_ keyValue : [String : Any]?){
        IGASDK().userProperties = keyValue
    }
    public static func addEvent(_ eventName : String,_ keyValue : [String : Any]){
        DfineryAPIService.shared.addEvent(eventName, keyValue)
    }
    public static func setLocation(lat : Double, lng : Double){
        
    }
}
