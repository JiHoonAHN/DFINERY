import Foundation
import Combine

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var contentType: String { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
}

extension Request{
    var method: HTTPMethod { return .post }
    var contentType: String { return "application/json" }
    var queryParams: [String: String]? { return nil }
    var body: Data? { return nil }
    var headers: [String: String]? { return nil }
}

public extension Request{
    func asURLRequest(baseURL: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.allHTTPHeaderFields = headers
        return request
    }
}
