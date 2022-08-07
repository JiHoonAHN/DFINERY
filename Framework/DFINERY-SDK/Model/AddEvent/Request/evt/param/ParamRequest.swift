import Foundation

public struct ParamDTO: Codable{
    let menuName : String
    let menuId : Int
    
    enum CodingKeys : String, CodingKey{
        case menuName = "menu_name"
        case menuId = "menu_id"
    }
}
