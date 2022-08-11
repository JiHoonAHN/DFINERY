import Foundation

extension Date{
    func usingDate() -> String{
        let date = self
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyyMMddHHmmss"
        return dataFormatter.string(from: date)
    }
}
