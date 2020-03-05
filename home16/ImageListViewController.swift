

import UIKit

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var maintableView: UITableView!
    
    var imageArarray: [Image] = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ImageLibrary"
        maintableView.dataSource = self
        
    }
    
    @IBAction func addImage(_ sender: UIBarButtonItem) {
        let addImageViewController = AddImageViewController.viewControllerWithStoryboard()
        if let addImageViewController = addImageViewController {
            addImageViewController.delegate = self
            navigationController?.pushViewController(addImageViewController, animated: true)
            
        }
    }
    
}

// MARK: EXTENSION

extension ImageListViewController: UITableViewDataSource,AddImageViewControllerDelegate {
    func image(image: Image) {
        imageArarray.append(image)
        maintableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageArarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = imageArarray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        
        cell.set(image: element)
        return cell
    }
    
    
}
