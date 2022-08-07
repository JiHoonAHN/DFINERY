import Foundation

public class IGASDK{
    private let appKey : String
        
    public init(appKey: String){
        self.appKey = appKey
        print(appKey)
    }
    
    public static func setUserProperty(_ keyValue : [String : Any]?){
        let object = DictToJson.dictionaryToObject(objectType: UserPropertiesDTO.self, dictionary: keyValue!)
            
    }
    public static func addEvent(_ eventName : String, keyValue : [String : Any]){
        let object = DictToJson.dictionaryToObject(objectType: ParamDTO.self, dictionary: keyValue)
    }
}
