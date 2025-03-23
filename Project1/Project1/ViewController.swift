import UIKit

class ViewController: UITableViewController {
    let storage = PictureStorage.getInstance()
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage.load()
        
        title = "Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = storage.pictures[indexPath.row]
        cell.contentConfiguration = configuration
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedPictureIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

