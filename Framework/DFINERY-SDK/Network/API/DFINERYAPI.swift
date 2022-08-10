import Foundation

enum DFINERYAPI{
    case addEvent
}

extension DFINERYAPI : Request{
    var path: String {
        switch self{
        case .addEvent:
            return "/api/AddEvent"
        }
    }
}
