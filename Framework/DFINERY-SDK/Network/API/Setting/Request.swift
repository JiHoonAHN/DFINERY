import Foundation

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    associatedtype ReturnType: Codable
}

public extension Request{
    func asURLRequest(body : Data) -> URLRequest? {
        guard var urlComponents = URLComponents(string: BaseURL().dfineryBaseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.httpBody = body
        return request
    }
}
