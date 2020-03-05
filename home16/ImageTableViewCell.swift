
import UIKit

class ImageTableViewCell: UITableViewCell {

    
    
   @IBOutlet private weak var imageNameLabel: UILabel!
   @IBOutlet private weak var oimageView: UIImageView!
    
    func set (image: Image) {
        imageNameLabel.text = image.name
        oimageView.image = image.image
    }

}
