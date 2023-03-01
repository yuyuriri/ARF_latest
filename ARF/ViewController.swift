//
//  ViewController.swift
//  ARF!
//
//  Created by 滑川裕里瑛 on 2022/11/16.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let roomfreglance = [
        "roomfreglance1",
        "roomfreglance2",
        "roomfreglance3"
        ]
    
    var index = 0
    
    @IBOutlet weak var mainSceneView: ARSCNView!
    
//    @IBOutlet var heartButton: UIButton!
    
    //検出用configを作成
    let configuration = ARWorldTrackingConfiguration()
    
//    var index = 0
//    
//    var data: [Int] = []
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(index)
        
//        data = saveData.object(forKey: "data") as! [Int]
        
//        if data[index] == 1{
//
//
//            heartButton.setImage(UIImage(systemName: "heart.fill"),for: .normal)
//
//        }
        
        mainSceneView.delegate = self
        
        initialize()
        registerGestureRecognizers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチした最初の座標を取り出す
        guard let touch = touches.first else { return }
        
        // タッチで取得した座標をスクリーン座標系に変換
        let touchPosition = touch.location(in: mainSceneView)
        
        //これより下がhitTest(_:types:)の代わりのコード
        guard let query = mainSceneView.raycastQuery(from: touchPosition, allowing: .existingPlaneGeometry, alignment: .any) else { return }
        let results = mainSceneView.session.raycast(query)
        print(results)
        guard let hitTestResult = results.first else {
            print("no surface found")
            return
        }
        let anchor = ARAnchor(transform: hitTestResult.worldTransform)
        mainSceneView.session.add(anchor: anchor)
    }
    
    func initialize (){
        
//        self.mainSceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.mainSceneView.session.run(configuration)
        self.mainSceneView.autoenablesDefaultLighting = true
        
        
    }
    
    func registerGestureRecognizers() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.mainSceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapped(sender: UITapGestureRecognizer) {
        let sceneView = sender.view as! ARSCNView
        let tapLocation = sender.location(in: mainSceneView)
        
        let hitTest = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        if !hitTest.isEmpty {
            
            //let interiorHeight = interior.boundingBox.max.y-interior.boundingBox.min.y
            // オブジェクトノードの高さを計算
            //let tappedCoodinates = hitTest.first?.localCoordinates
            // タップと平面ノードの交差点
            //interior.position = SCNVector3(tappedCoodinates!.x, interiorHeight/2, tappedCoodinates!.z)
            // オブジェクトの原点はオブジェクトの中心にしたので、高さの半分だけ上に置く
            //planeNode.addChildNode(interior)
            
            self.addItem(hitTestResult: hitTest.first!)
        } else {
            return
        }
    }
    
    func addItem(hitTestResult: ARHitTestResult) {

        // scene を作成
        let scene = SCNScene(named: "Models.scnassets/\(roomfreglance[index]).scn")!
        
        //  node を作成
        let node = (scene.rootNode.childNode(withName: roomfreglance[index], recursively: false))!
        
        // 現実世界の座標を取得
        let transform = hitTestResult.worldTransform
        let thirdColumn = transform.columns.3
        
        // アイテムの配置
        node.position = SCNVector3(thirdColumn.x, thirdColumn.y, thirdColumn.z)
        
        // sceneに nodeを追加
        self.mainSceneView.scene.rootNode.addChildNode(node)
    }
    
    
    
}
