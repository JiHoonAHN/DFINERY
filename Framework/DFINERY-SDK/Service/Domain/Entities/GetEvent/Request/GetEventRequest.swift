import Foundation

public struct GetEventReq: Equatable{
    public init(appkey : String,length : Int){
        self.appkey = appkey
        self.length = length
    }
    let appkey : String
    let length : Int
}
