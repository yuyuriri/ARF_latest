//
//  roomfreglanceViewController.swift
//  ARF
//
//  Created by 滑川裕里瑛 on 2022/12/14.
//

import UIKit

class roomfreglanceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var data: [Bool] = []
    var saveData: UserDefaults = UserDefaults.standard

    let roomfreglance = [
        ["roomfreglance1", "ルームフレグランス1"],
        ["roomfreglance2", "ルームフレグランス2"],
        ["roomfreglance3", "ルームフレグランス3"]
    ]
    
    let initialdata: [Bool] = [false,false,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 何も入ってない時だけ入れる
        if ((saveData.object(forKey: "favorite") as? [Bool]) == nil) {
            //  お気に入り更新
            saveData.set(initialdata, forKey: "favorite")
        }
        
        // 今のお気に入りを取得
        data = saveData.object(forKey: "favorite") as! [Bool]
        print("お気に入り")
        print(data)
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CustomCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 40 , height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        collectionView.collectionViewLayout = layout
        
        layout.scrollDirection = .horizontal
        //collectionView.collectionViewLayout = collectionView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        roomfreglance.count
    }
    
    // cellの中身を設定するメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomCellCollectionViewCell
        
        if let cell = cell as? CustomCellCollectionViewCell {
            cell.setupCell(imageName: roomfreglance[indexPath.row][0], labelText: roomfreglance[indexPath.row][1])
        }
        
        // 今のお気に入りを取得
       
            
            
            data = saveData.object(forKey: "favorite") as! [Bool]
            if data[indexPath.row] == true {
                cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .disabled)
            } else {
                cell.heartButton.setImage(UIImage(systemName: "heart"), for: .disabled)
            }
            
            return cell
        
    }
    
    // collectionViewのセルをタップした時に呼ばれるメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "godetail", sender: indexPath.row)
        
//        print(indexPath.row)
//
//        // ここ
//
//        if data[indexPath.row] == false {
//            data[indexPath.row] = true
//        }else if data[indexPath.row] == true {
//            data[indexPath.row] = false
//        }
//
//        saveData.set(data, forKey: "favorite")
//
//        print(data)
//
//
//        data = saveData.object(forKey: "favorite") as! [Bool]
//        print("お気に入り")
//
//        collectionView.reloadItems(at: [indexPath])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "godetail" {
            let detailViewController = segue.destination as! detailViewController
            detailViewController.index = sender as! Int
        }
    }
    
    
}

