import Foundation

extension Data {
    func encoding(_ dictionary : [String: Any]) -> Self?{
        try? JSONSerialization.data(
            withJSONObject: dictionary,
            options: [.fragmentsAllowed]
        )
    }
}
