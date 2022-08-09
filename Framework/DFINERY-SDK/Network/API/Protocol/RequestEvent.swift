import Foundation

protocol RequestEvent {
  func RequestBody(
    appKey: String,
    event: String,
    param: [String: Any]?,
    userProperties: [String: Any]?,
    identity: UserIdentity,
    location: UserLocation?
  ) -> Data?
}
