import Foundation
import Combine

struct NetworkDispatcher{
    let urlSession : URLSession!
    public init(urlSession : URLSession = .shared){
        self.urlSession = urlSession
    }
    
    func dispatch<ReturnType : Codable>(request : URLRequest) -> AnyPublisher<ReturnType,DfineryError>{
        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap(){ data, response in
                if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                    throw DfineryError.badRequest
                }
                return data
            }
            .decode(type: ReturnType.self, decoder: JSONDecoder())
            .mapError{ error in
                handleError(error)
            }
            .eraseToAnyPublisher()
    }
}

extension NetworkDispatcher{
    private func httpError(_ statusCode : Int) -> DfineryError{
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }
    private func handleError(_ error: Error) -> DfineryError {
        switch error {
        case is Swift.DecodingError:
            return .decodingError
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as DfineryError:
            return error
        default:
            return .unknownError
        }
    }
}
