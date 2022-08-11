import Foundation

public enum DFINERYAPI{
    case addEvent
}

extension DFINERYAPI : Request{
    public typealias ReturnType = CompleteResponse
    
    public var method: HTTPMethod {
        switch self{
        case .addEvent:
            return .post
        }
    }
    
    public var path: String {
        switch self{
        case .addEvent:
            return "/api/AddEvent"
        }
    }
}
