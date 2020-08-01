//
//  ViewController.swift
//  WorldTacking
//
//  Created by MAHIMA on 01/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit

enum Shapes: Int {
    case box = 0
    case capsule
    case cone
}

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    //MARK:- Properties
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }

    //MARK:- IBActions
    
    @IBAction func addShapeTapped(_ sender: Any) {
        guard let tag = (sender as? UIButton)?.tag, let shape = Shapes(rawValue: tag) else {return}
        let node = SCNNode()
        switch shape {
        case .box: node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1)
        case .capsule: node.geometry = SCNCapsule(capRadius: 0.1, height: 0.5)
        case .cone: node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.4)
        }
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.random
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        let xPoint = CGFloat.random(in: -0.2...0.2)
        let yPoint = CGFloat.random(in: -0.2...0.2)
        let zPoint = CGFloat.random(in: -0.2...0.2)
        node.position = SCNVector3(xPoint, yPoint, zPoint)
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        resetSession()
        
    }
    
    //MARK:- Private Methods
    
    private func resetSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{ (node, _ ) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    }
    
}

