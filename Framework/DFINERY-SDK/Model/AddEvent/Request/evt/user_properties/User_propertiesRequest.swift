import Foundation

public struct UserPropertiesDTO : Codable{
    let birthyear : Int
    let gender : String
    let level : Int
    let characterClass : String
    let gold : Int
    
    enum CodingKeys : String, CodingKey{
        case birthyear, gender, level, gold
        case characterClass = "character_class"
    }
}
