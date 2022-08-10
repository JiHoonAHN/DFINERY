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
    

}


