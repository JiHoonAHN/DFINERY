import Foundation

protocol RequestEvent {
  func requestBody(
    appKey: String,
    event: String,
    param: [String: Any]?,
    userProperties: [String: Any]?,
    identity: UserIdentity,
    location: UserLocation?
  ) -> Data?
}
