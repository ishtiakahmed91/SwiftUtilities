import UIKit

class MyUserDefaults {
    var documentUploadCompleted: Bool {
        get { return UserDefaults.standard.bool(forKey: #function) }
        set { UserDefaults.standard.set(newValue, forKey: #function) }
    }
}

let defaults = MyUserDefaults()
defaults.documentUploadCompleted = true
print(defaults.documentUploadCompleted)

// Extension
// We can simply achieve UserDefault key consistency by using #function name as a key
extension UserDefaults {
    var documentUploadCompleted: Bool {
        get { return bool(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
