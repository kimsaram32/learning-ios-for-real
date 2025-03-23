/* havent learned about CoreData or something ahh this sucks */

import Foundation

class PictureStorage {
    private static var instance: PictureStorage?
    
    static func getInstance() -> PictureStorage {
        if let instance {
            return instance
        }
        instance = PictureStorage()
        return instance!
    }
    
    var pictures = [String]()
    
    private init() {}

    func load() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let files = try! fm.contentsOfDirectory(atPath: path)
        pictures = files.filter({ $0.starts(with: "nssl") }).sorted()
    }
}
