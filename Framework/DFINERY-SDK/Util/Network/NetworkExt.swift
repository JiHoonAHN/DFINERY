import Foundation
import Network

extension NWPathMonitor{
    func statusString() -> String{
        if currentPath.usesInterfaceType(.wifi) {
          return "wifi"
        } else if currentPath.usesInterfaceType(.cellular) {
          return "cellular"
        } else {
          return "disconnect"
        }
    }
}
