import Foundation

public extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

public class PrintTimer {
    let start = Date()
    let name: String
    public init(file: String=#file, line: Int=#line, function: String=#function, name: String?=nil) {
        let file = file.split(separator: "/").last!
        self.name = name ?? "\(file):\(line) - \(function)"
    }
    public func done() {
        let end = Date()
        print("\(self.name) is taking:  \((end.timeIntervalSinceReferenceDate - self.start.timeIntervalSinceReferenceDate).format(f: ".5")) seconds to complete.")
    }
}

func print100numbers() {
    for index in 0...100 {
        print(index)
    }
}


let timer = PrintTimer()
print100numbers()
timer.done()


