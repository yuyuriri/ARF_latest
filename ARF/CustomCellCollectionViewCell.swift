import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
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
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
   
}
