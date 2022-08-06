import Foundation

struct AddEventReq: Encodable{
    let evt : EvtReq
    let common : CommonReq
}
