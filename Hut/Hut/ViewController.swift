//
//  ViewController.swift
//  Hut
//
//  Created by MAHIMA on 01/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    //MARK:- IBOutlets
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    //MARK:- Properties
    
    let configuration = ARWorldTrackingConfiguration()
    
    //MARK:- Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.autoenablesDefaultLighting = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.session.run(configuration)
    }
    
    //MARK:- IBAction
    
    @IBAction func addHut(_ sender: Any) {
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        boxNode.position = SCNVector3(0, 0, -0.1)
        sceneView.scene.rootNode.addChildNode(boxNode)
        let pyramidNode = SCNNode()
        pyramidNode.geometry = SCNPyramid(width: 0.1, height: 0.05, length: 0.1)
        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramidNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        pyramidNode.position = SCNVector3(0, 0.05, -0.1)
        sceneView.scene.rootNode.addChildNode(pyramidNode)
       
    }
    
}

