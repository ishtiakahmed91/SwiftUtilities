import Foundation

extension String {
    
    var isNotEmpty: Bool {
        get {
            return !self.isEmpty
        }
    }
    
    func camelCaseId() -> String {
        return self.components(separatedBy: " ").enumerated().map { (index, element) -> String in
            if index == 0 {
                return element.replacingCharacters(in: element.startIndex...element.startIndex, with: String(element[startIndex]).lowercased())
            } else {
                return element.replacingCharacters(in: element.startIndex...element.startIndex, with: String(element[startIndex]).uppercased())
            }
            }.reduce("", +)
    }
    
    func removeSpecialCharacters() -> String {
        let allowedCharacters = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890?!.,")
        return self.filter {allowedCharacters.contains($0) }
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, self.count) ..< self.count]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(self.count, r.lowerBound)),
                                            upper: min(self.count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

var id = "Home view Contoller"
var sentence1 = "You have limite%d time!"

print(id.camelCaseId())
print(sentence1.removeSpecialCharacters())
