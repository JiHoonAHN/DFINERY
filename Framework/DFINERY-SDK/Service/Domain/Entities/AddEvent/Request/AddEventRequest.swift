import Foundation

public struct AddEventReq: Equatable{
    public init(evt : Evt,common: Common){
        self.evt = evt
        self.common = common
    }
    
    let evt : Evt
    let common : Common
    
    public struct Evt : Equatable{
        public init(createdAt: String,event : String,location : LocationReq,param : ParamReq,userProperties : UserPropertiesReq){
            self.createdAt = createdAt
            self.event = event
            self.location = location
            self.param = param
            self.userProperties = userProperties
        }
        
        let createdAt : String
        let event : String
        let location : LocationReq
        let param : ParamReq
        let userProperties : UserPropertiesReq
        
        public struct LocationReq : Equatable{
            public init(lat : Float, lng : Float){
                self.lat = lat
                self.lng = lng
            }
            
            let lat : Float
            let lng : Float
        }
        
        public struct ParamReq: Equatable {
            public init(menuName : String, menuId :Int){
                self.menuName = menuName
                self.menuId = menuId
            }
            
            let menuName : String
            let menuId : Int
        }
        
        public struct UserPropertiesReq : Equatable{
            public init(birthyear: Int, gender : String, level : Int, characterClass: String, gold : Int){
                self.birthyear = birthyear
                self.gender = gender
                self.level = level
                self.characterClass = characterClass
                self.gold = gold
            }
            
            let birthyear : Int
            let gender : String
            let level : Int
            let characterClass : String
            let gold : Int
        }
    }
    
    public struct Common : Equatable{
        public init(identity : IdentityReq,deviceInfo : DeviceInfoReq,packageName : String,appkey : String){
            self.identity = identity
            self.deviceInfo = deviceInfo
            self.packageName = packageName
            self.appkey = appkey
        }
        
        let identity : IdentityReq
        let deviceInfo : DeviceInfoReq
        let packageName : String
        let appkey : String
        
        public struct IdentityReq: Equatable{
            let adid : String
            let adidOptOut : Bool
        }
        
        public struct DeviceInfoReq : Equatable{
            public init(os : String, model : String, resolution: String, isPortrait: Bool, platform: String,network : String,carrier : String,language : String, country : String){
                self.os = os
                self.model = model
                self.resolution = resolution
                self.isPortrait = isPortrait
                self.platform = platform
                self.network = network
                self.carrier = carrier
                self.language = language
                self.country = country
            }
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
