import Foundation

extension Date{
    func usingDate() -> String{
        let date = self
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyyMMdd"
        return dataFormatter.string(from: date)
    }
}
