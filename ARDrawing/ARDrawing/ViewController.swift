//
//  ViewController.swift
//  ARDrawing
//
//  Created by MAHIMA on 03/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.session.run(configuration)
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.showsStatistics = true
    }

    @IBAction func drawTapped(_ sender: Any) {
        
    }
    
}

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pointOfView = sceneView.pointOfView else {return}
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPositionOfCamera = orientation + location
        let sphereNode = SCNNode()
        DispatchQueue.main.async {
            if self.drawButton.isHighlighted {
                sphereNode.geometry = SCNSphere(radius: 0.02)
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
                sphereNode.position = currentPositionOfCamera
                self.sceneView.scene.rootNode.addChildNode(sphereNode)
            } else {
                let pointer = SCNNode(geometry: SCNSphere(radius: 0.01))
                pointer.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
                pointer.position = currentPositionOfCamera
                pointer.name = "pointer"
                self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
                    if node.name == "pointer"  {
                     node.removeFromParentNode()
                    }
                }
                self.sceneView.scene.rootNode.addChildNode(pointer)
            }
        }
    }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
