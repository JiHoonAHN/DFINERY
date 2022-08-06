import Foundation

public class IGASDK{
    private let appKey : String
    
    public init(appKey: String){
        self.appKey = appKey
    }
    public static func setUserProperty() -> UserPropertiesDTO{
        return UserPropertiesDTO(birthyear: 1, gender: "", level: 1, characterClass: "", gold: 1)
    }
    public static func addEvent(){
        
    }
}
