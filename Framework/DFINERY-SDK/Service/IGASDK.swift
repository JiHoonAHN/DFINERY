import Foundation
import Combine

public final class IGASDK{
    //MARK: - Cancellable
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: - Networking Properties
    let dispatcher = NetworkDispatcher()
    let api = APIClient()
    
    //MARK: - Properties
    private let appKey : String
    
    //MARK: - init
    public init(appKey: String){
        self.appKey = appKey
    }

    //MARK: - Method
    public static func setUserProperty(_ keyValue : [String : Any]?){
        DfineryAPIService.shared.setUserProperty(keyValue)
        print()
        
    }
    public static func addEvent(_ eventName : String,_ keyValue : [String : Any]){
        DfineryAPIService.shared.addEvent(eventName, keyValue)
    }
}
