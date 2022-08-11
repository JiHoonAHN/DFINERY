import Foundation
import Combine

final class APIClient{
    static let shared = APIClient()
    //MARK: - Properties
    private let urlSession : URLSession
    private let requestEvent : RequestEvent
    private let networkDispatcher : NetworkDispatcher
    
    //MARK: - Init
    init(
        urlSession : URLSession = URLSession.shared,
        requestEvent : RequestEvent = RequestClient(),
        networkDispatcher : NetworkDispatcher = NetworkDispatcher()
    ){
        self.urlSession = urlSession
        self.requestEvent = requestEvent
        self.networkDispatcher = networkDispatcher
    }
    
    func addEvent<R: Request>(
        request : R.Type,
        appKey: String,
        event: String,
        param: [String: Any]?,
        userProperties: [String: Any]?,
        identity: UserIdentity,
        location: UserLocation?
    ) -> AnyPublisher<R.ReturnType, DfineryError>?{
        guard let body = self.requestEvent.requestBody(
            appKey: appKey,
            event: event,
            param: param,
            userProperties: userProperties,
            identity: identity,
            location: location
        ) else {return nil}
        guard let req = DFINERYAPI.addEvent.asURLRequest(body: body) else {return nil}

        typealias RequestPublisher = AnyPublisher<R.ReturnType, DfineryError>
        let requestPublisher : RequestPublisher = networkDispatcher.dispatch(request: req)
        return requestPublisher.eraseToAnyPublisher()
        
    }
}


