//
//  detailViewController.swift
//  ARF
//
//  Created by 滑川裕里瑛 on 2023/02/01.
//

import UIKit
import SafariServices

class detailViewController: UIViewController {
    
    let roomfreglance = ["SAVON FRAGRANCE DIFFUSER LIQUID", "アルボル フレグランス ディフューザー", "デュオレディー ルームフレグランス"]
    let price = ["5720円", "2320円", "3900円"]
    
    let images: [UIImage] = [
        UIImage(named: "roomfreglance1")!,
        UIImage(named: "roomfreglance2")!,
        UIImage(named: "roomfreglance3")!
    ]
    
    let URLs = [
        URL(string: "https://shiro-shiro.jp/item/12716.html"),
        URL(string: "https://francfranc.com/products/1105120176402"),
        URL(string: "https://francfranc.com/products/1105120217709")
    ]
    
    
    
    
    var index = 0
    
    var data = [Int]()
    
    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageImage: UIImageView!
    @IBOutlet var URLButton: UIButton!
    @IBOutlet var latestheartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = String(roomfreglance[index])
        priceLabel.text = String(price[index])
        imageImage.image = images[index]
        
        //      nameLabelとpriceLabelの文字サイズを自動変更する
        nameLabel.adjustsFontSizeToFitWidth = true
        priceLabel.adjustsFontSizeToFitWidth = true
        
        data = saveData.object(forKey: "data") as! [Int]
        
        if data[index] == 1{
            
        latestheartButton.setImage(UIImage(systemName: "heart.fill"),for: .normal)
            
        }
        
    }
    
    @IBAction func openURLTapped(_ sender: Any) {
        guard let url = URLs[index] else { return }
        let safariView = SFSafariViewController(url: url)
        present(safariView, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goar" {
            let ViewController = segue.destination as! ViewController
            ViewController.index = index
        }
    }
    
    @IBAction func didTapheart() {
        if data[index] == 0 {
            
            data[index] = 1
            
            latestheartButton.setImage(UIImage(systemName: "heart.fill"),for: .normal)
            
            
        }else if data[index] == 1 {
            
            data[index] = 0
            
            latestheartButton.setImage(UIImage(systemName: "heart"),for: .normal)
            
        }
        
        saveData.set(data,forKey: "data")
    }

}
