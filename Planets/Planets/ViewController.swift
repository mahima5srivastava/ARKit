//
//  ViewController.swift
//  Planets
//
//  Created by MAHIMA on 03/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nodeEarth = SCNNode(geometry: SCNSphere(radius: 0.2))
        nodeEarth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "EarthDay")
        nodeEarth.geometry?.firstMaterial?.specular.contents = UIImage(named: "EarthReflection")
        nodeEarth.geometry?.firstMaterial?.emission.contents = UIImage(named: "Clouds")
        nodeEarth.geometry?.firstMaterial?.normal.contents = UIImage(named: "EarthNormal")
        
        
        
        nodeEarth.position = SCNVector3(0.0, 0.0, -0.02)
        sceneView.scene.rootNode.addChildNode(nodeEarth)
        
        let action = SCNAction.rotateBy(x: CGFloat(0), y: CGFloat(90.0).degreesToRadians(), z: CGFloat(0), duration: 3)
        let foreverAction = SCNAction.repeatForever(action)
        nodeEarth.runAction(foreverAction)
  
        
    }
}

extension CGFloat {
    func degreesToRadians() -> CGFloat {
        return (self * .pi/180)
    }
}
