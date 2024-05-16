import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flags"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        // load images
        let items = try! fm.contentsOfDirectory(atPath: path).filter{$0.hasSuffix("3x.png")}
        
        flags.append(contentsOf: items)
        flags.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        
        let countryName = flags[indexPath.row]
            .replacingOccurrences(of: "@3x.png", with: "")
        
        cell.textLabel?.text = (countryName == "us" || countryName == "uk") ? countryName.uppercased() : countryName.capitalized
        
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
        cell.imageView?.layer.borderWidth = 1
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flags[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}


