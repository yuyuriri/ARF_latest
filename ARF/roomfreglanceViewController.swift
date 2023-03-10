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
    
//    var data: [Bool] = []
    var saveData: UserDefaults = UserDefaults.standard

    let roomfreglance = [
        ["roomfreglance1", "SAVON FRAGRANCE DIFFUSER LIQUID"],
        ["roomfreglance2", "アルボル フレグランス ディフューザー"],
        ["roomfreglance3", "デュオレディー ルームフレグランス"]
    ]
    
    let initialdata: [Int] = [0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 何も入ってない時だけ入れる
        if ((saveData.object(forKey: "data") as? [Int]) == nil) {
            //  お気に入り更新
            saveData.set(initialdata, forKey: "data")
        }
//        
//        // 今のお気に入りを取得
//        data = saveData.object(forKey: "favorite") as! [Bool]
//        print("お気に入り")
//        print(data)
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CustomCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        let layout = UICollectionViewFlowLayout()
        // cellのサイズを設定
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 20 , height: 250)
        layout.sectionInset = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        roomfreglance.count
    }
    
    // cellの中身を設定するメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomCellCollectionViewCell
        cell.setupCell(imageName: roomfreglance[indexPath.row][0], labelText: roomfreglance[indexPath.row][1])
        
//        if let cell = cell as? CustomCellCollectionViewCell {
//            cell.setupCell(imageName: roomfreglance[indexPath.row][0], labelText: roomfreglance[indexPath.row][1])
//        }
        return cell
        
    }
    
    // collectionViewのセルをタップした時に呼ばれるメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "godetail", sender: indexPath.row)
        
//        print(indexPath.row)
//
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

