

import UIKit

protocol AddImageViewControllerDelegate: AnyObject {
    func image (image: Image)
}

class AddImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageNameTextFIeld: UITextField!
    @IBOutlet weak var imageVIEW: UIImageView!
    
    var delegate: AddImageViewControllerDelegate?
    let pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
        title = "Add Image"
        
    }
    
    @IBAction func loadImageButtonDidtap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "What to open", message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Library", style: .default, handler: { (_
            ) in
            self.pickerController.allowsEditing = true
            self.pickerController.sourceType = .savedPhotosAlbum
            
            self.present(self.pickerController, animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageVIEW.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonDidClick(_ sender: UIButton) {
        let name = imageNameTextFIeld.text
        let image = imageVIEW.image
        if let image = image {
            let iamageTake = Image(name: name!, image: image)
            delegate?.image(image: iamageTake)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
}
