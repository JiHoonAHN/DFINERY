import Foundation

struct AddEventReq: Equatable{
    let evt : Evt
    let common : Common
    
    struct Evt : Equatable{
        let createdAt : String
        let event : String
        let location : LocationReq
        let param : ParamReq
        let userProperties : UserPropertiesReq
        
        struct LocationReq : Equatable{
            let lat : Float
            let lng : Float
        }
        
        struct ParamReq: Equatable {
            let menuName : String
            let menuId : Int
        }
        
        struct UserPropertiesReq : Equatable{
            let birthyear : Int
            let gender : String
            let level : Int
            let characterClass : String
            let gold : Int
        }
    }
    
    struct Common : Equatable{
        let identity : IdentityReq
        let deviceInfo : DeviceInfoReq
        let packageName : String
        let appkey : String
        
        struct IdentityReq: Equatable{
            let adid : String
            let adidOptOut : Bool
        }
        
        struct DeviceInfoReq : Equatable{
            let os : String
            let model : String
            let resolution : String
            let isPortrait : Bool
            let platform : String
            let network : String
            let carrier : String
            let language : String
            let country : String
        }
    }
}
