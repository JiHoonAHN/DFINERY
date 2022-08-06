import Foundation
import Combine

protocol DfineryRepository{
    func postAddEvent() -> AnyPublisher<Data, DfineryError>
    func postGetEvent() -> AnyPublisher<Data, DfineryError>
}
