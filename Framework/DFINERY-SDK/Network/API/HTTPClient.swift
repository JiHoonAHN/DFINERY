import Foundation
import Combine

public class HttpClient{
    public static let shared = HttpClient()
    
    public func request<T: Codable>(path : String ,type : T.Type) -> AnyPublisher<T, DfineryError>{
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: path, relativeTo: BaseURL().dfineryBaseURL)!)
            .tryMap(){ data, response in
                guard let httpResponse = response as? HTTPURLResponse else{
                    throw DfineryError.error(message: "Response Error", errorBody: .init())
                }
                guard 200..<300 ~= httpResponse.statusCode else{
                    throw DfineryError.error(message: "statusCode", errorBody: [String(httpResponse.statusCode): httpResponse.description])
                }
                guard !data.isEmpty else{
                    throw DfineryError.error(message: "Unknown", errorBody: .init())
                }
                return data
            }
            .decode(type: type, decoder: JSONDecoder())
            .mapError{ error in
                if let error = error as? DfineryError{
                    return error
                }else{
                    return DfineryError.error(message: "unknown", errorBody: .init())
                }
            }
            .eraseToAnyPublisher()
    }
}
