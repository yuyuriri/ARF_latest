//
//  favoriteViewController.swift
//  ARF
//
//  Created by 滑川裕里瑛 on 2023/01/15.
//

import UIKit

class favoriteViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!
    
    
    let roomfreglancedata = ["SAVON FRAGRANCE DIFFUSER LIQUID", "アルボル フレグランス ディフューザー", "デュオレディー ルームフレグランス"]
    
    var data: [Int] = []
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var showdataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        table.dataSource = self
        
        data = saveData.object(forKey: "data") as! [Int]
        print("お気に入り")
        print(data)
        
        for i in 0 ..< roomfreglancedata.count{
            
            if data[i]==1 {
                
                showdataArray.append(roomfreglancedata[i])
            }
        }
    }
    
    @IBAction func backhome() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection sectiion: Int) -> Int {
        return showdataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = showdataArray[indexPath.row]
        
        return cell!
        
    }
  
}
