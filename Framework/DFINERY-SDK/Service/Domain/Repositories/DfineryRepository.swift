import Foundation
import Combine

protocol DfineryRepository{
    func postAddEvent(_ keyValue : [String : Any]) -> AnyPublisher<Data, DfineryError>
    func postGetEvent(_ eventName : String, keyValye : [String : Any]) -> AnyPublisher<Data, DfineryError>
}
