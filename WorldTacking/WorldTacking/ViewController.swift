//
//  ViewController.swift
//  WorldTacking
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }

    //MARK:- IBActions
    
    @IBAction func addTapped(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        let xPoint = getRandomPoint(between: -0.2, secondPoint: 0.2)
        let yPoint = getRandomPoint(between: -0.2, secondPoint: 0.2)
        let zPoint = getRandomPoint(between: -0.2, secondPoint: 0.2)
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
    
    private func getRandomPoint(between firstPoint: CGFloat, secondPoint: CGFloat) -> CGFloat {
        guard firstPoint != secondPoint else {return firstPoint}
        var nearPoint = firstPoint
        var farPoint = secondPoint
        if nearPoint > farPoint {
            var temp = nearPoint
            nearPoint = farPoint
            farPoint = temp
        }
        
        let random = CGFloat.random(in: nearPoint..<farPoint)
        return CGFloat(random)
    }
    
}

