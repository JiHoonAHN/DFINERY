import Foundation
import Combine

final class DfineryAPIService{
    static let shared = DfineryAPIService()
    
    //MARK: - Network Properties
    private var cancellable = Set<AnyCancellable>()
    let dispatcher = NetworkDispatcher()
    let apiClient = APIClient()
    
    func addEvent(_ eventName : String,_ keyValue : [String : Any]?){
        apiClient.dispatch(AddEventRequest(body: keyValue ?? .init()))
            .sink(receiveCompletion: {result in }, receiveValue: {_ in})
            .store(in: &cancellable)
    }
    func setUserProperty(_ keyValue : [String : Any]?){
        
    }
}
