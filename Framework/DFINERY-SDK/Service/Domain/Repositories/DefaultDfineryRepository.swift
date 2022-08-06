import Foundation
import Combine

protocol DefaultDfineryRepository{
    func postAddEvent() -> AnyPublisher<Data, DfineryError>
    func postGetEvent() -> AnyPublisher<Data, DfineryError>
}
