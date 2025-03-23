import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedPictureIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedPictureIndex {
            let storage = PictureStorage.getInstance()
            let picture = storage.pictures[selectedPictureIndex]
            title = "Picture \(selectedPictureIndex + 1) of \(storage.pictures.count)"
            imageView.image = UIImage(named: picture)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
