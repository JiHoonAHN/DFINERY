import Foundation
import Combine

struct APIClient{
    var baseURL : String!
    var networkDispatcher : NetworkDispatcher!
    
    init(
        baseURL: String = BaseURL().dfineryBaseURL,
        networkDispatcher: NetworkDispatcher = NetworkDispatcher()
    ) {
        self.baseURL = baseURL
        self.networkDispatcher = networkDispatcher
    }
    
    func dispatch<R: Request>(_ request : R) -> AnyPublisher<R.ReturnType, DfineryError>{
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else{
            return Fail(outputType: R.ReturnType.self, failure: DfineryError.badRequest)
                .eraseToAnyPublisher()
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, DfineryError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}
