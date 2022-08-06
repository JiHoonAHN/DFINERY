import Foundation

struct UserPropertiesReq : Encodable{
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
