import Foundation
import Combine

final class LoggingSystem {
    
    //MARK: - Properties
    private var cancellable = Set<AnyCancellable>()
    private let httpClient : APIClient
    
    //MARK: - Init
    init(httpClient : APIClient = APIClient()){
        self.httpClient = httpClient
    }
    
    //MARK: - Method
    func system(
        appKey: String,
        event: String,
        param: [String: Any]?,
        userProperties: [String: Any]?,
        identity: UserIdentity,
        location: UserLocation?
    ){
        httpClient.addEvent(
            request: DFINERYAPI.self,
            appKey: appKey,
            event: event,
            param: param,
            userProperties: userProperties,
            identity: identity,
            location: location
        )?.sink(
            receiveCompletion: { completion in
                switch completion{
                case .finished:
                    print("finished")
                case let .failure(error):
                    print(error)
                }
            },
            receiveValue: {value in
                print(value)
            })
        .store(in: &cancellable)
    }

}
