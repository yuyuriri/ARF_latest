import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var heartButton: UIButton!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var index = 0
    
//    var showdataArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = ""
        imageView.image = UIImage()
    }
    
    func setupCell(imageName: String, labelText: String) {
        label.text = labelText
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func tapfavorite() {
        
        
    }
    
   
}
