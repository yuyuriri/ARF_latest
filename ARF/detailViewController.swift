//
//  detailViewController.swift
//  ARF
//
//  Created by 滑川裕里瑛 on 2023/02/01.
//

import UIKit

class detailViewController: UIViewController {
    
    let roomfreglance = ["ルームフレグランス1", "ルームフレグランス2", "ルームフレグランス3"]
    let price = ["1980円", "2980円", "3980円"]
    
    let image: [UIImage] = [
        UIImage(named: "roomfreglance1")!,
        UIImage(named: "roomfreglance2")!,
        UIImage(named: "roomfreglance3")!
    ]
    
    var index = 0
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        nameLabel.text = String(roomfreglance[index])
        priceLabel.text = String(price[index])
//        imageImage.image = UIImage(data: imageImage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
