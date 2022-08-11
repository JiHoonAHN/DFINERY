import Foundation

struct UserIdentity {
    static let `default` = "00000000-0000-0000-0000-000000000000"
    var adidOptOut : Bool
    var appleAdidIdentity : String
    
    init(
        adidOptOut: Bool = false,
        appleAdidIdentity: String = UserIdentity.default
    ) {
        self.adidOptOut = adidOptOut
        self.appleAdidIdentity = appleAdidIdentity
    }
}
