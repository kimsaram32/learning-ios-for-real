import UIKit

struct Student {
    
    let classId: Int
    let name: String
    var profileImage: UIImage?
    let nickname: String? = nil
    
    var formattedName: String {
        "\(classId) \(name)"
    }
    
    init(classId: Int, name: String) {
        self.classId = classId
        self.name = name
        self.profileImage = UIImage(named: name)
        if self.profileImage == nil {
            self.profileImage = UIImage.default
        }
    }
    
    init(classId: Int, name: String, profileImage: UIImage?) {
        self.classId = classId
        self.name = name
        self.profileImage = profileImage
    }
}

extension Student {
    
    static let list = [
        Student(classId: 1101, name: "김민균"),
        Student(classId: 1102, name: "김민수"),
        Student(classId: 1103, name: "김민정"),
        Student(classId: 1104, name: "김준모"),
        Student(classId: 1105, name: "김태균"),
        Student(classId: 1106, name: "남우현"),
        Student(classId: 1107, name: "박준우"),
        Student(classId: 1108, name: "박하원"),
        Student(classId: 1109, name: "선윤재"),
        Student(classId: 1110, name: "손서원"),
        Student(classId: 1111, name: "신유원"),
        Student(classId: 1112, name: "신주희"),
        Student(classId: 1113, name: "유서희"),
        Student(classId: 1114, name: "이진서"),
        Student(classId: 1115, name: "장윤호"),
        Student(classId: 1116, name: "최창용"),
    ]
}
