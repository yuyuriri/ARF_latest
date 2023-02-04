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
    
    let URL = [
        NSURL(string: "https://shiro-shiro.jp/item/12716.html"),
        NSURL(string: "https://francfranc.com/products/1105120176402"),
        NSURL(string: "https://francfranc.com/products/1105120217709")
    ]
    
    
    var index = 0
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageImage: UIImageView!
    @IBOutlet var URLButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameLabel.text = String(roomfreglance[index])
        priceLabel.text = String(price[index])
        
        
        //        選んだcellによってimageをそれぞれ変えたい
        //        imageImage.image = UIImage(data: imageImage)
        //        URLButton.buttonType = String(URL[index])
        
        //      nameLabelとpriceLabelの文字サイズを自動変更する
        nameLabel.adjustsFontSizeToFitWidth = true
        priceLabel.adjustsFontSizeToFitWidth = true
        
    }
    
        @IBAction func openURLTapped(_ sender: Any) {
            guard let url = Foundation.URL(string: "https://shiro-shiro.jp/item/12716.html") else { return }
            UIApplication.shared.open(url)
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
