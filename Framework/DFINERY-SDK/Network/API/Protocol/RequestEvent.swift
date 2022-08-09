import Foundation

protocol RequestEvent {
  func RequestBody(
    appKey: String,
    eventName: String,
    param: [String: Any]?,
    userProperties: [String: Any]?,
    identity: [String: Any],
    location: [String: Any]?
  ) -> Data?
}
