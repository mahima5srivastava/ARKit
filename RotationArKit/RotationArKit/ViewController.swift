//
//  ViewController.swift
//  RotationArKit
//
//  Created by MAHIMA on 02/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    //MARK:- IBoutlets
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    //MARK:- Properties
    
    let configuration = ARWorldTrackingConfiguration()
    
    //MARK:- Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        sceneView.automaticallyUpdatesLighting = true
        sceneView.session.run(configuration)
    }

    @IBAction func addTapped(_ sender: Any) {
        let pyramidNode = SCNNode()
        pyramidNode.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        pyramidNode.position = SCNVector3(x: 0.0, y: 0.0, z: -0.12)
        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        pyramidNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        pyramidNode.eulerAngles = SCNVector3(90.radianValue(), 0, 0)
        sceneView.scene.rootNode.addChildNode(pyramidNode)
        
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        sceneView.session.pause()
        
    }
}

