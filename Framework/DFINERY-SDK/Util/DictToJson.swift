import Foundation

public class DictToJson {
    public static func dictionaryToObject<T:Decodable>(objectType:T.Type,dictionary:[String:Any]) -> Data? {
        guard let dictionaries = try? JSONSerialization.data(withJSONObject: dictionary) else { return nil }
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let object = try? encoder.encode(dictionaries)
        return object
    }
}
