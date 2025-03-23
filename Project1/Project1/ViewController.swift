import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        let path = Bundle.main.resourcePath!
        let files = try! manager.contentsOfDirectory(atPath: path)
        
        for file in files {
            if file.starts(with: "nssl") {
                pictures.append(file)
            }
        }
        
        title = "Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = pictures[indexPath.row]
        cell.contentConfiguration = configuration
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

