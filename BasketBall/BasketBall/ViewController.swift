//
//  ViewController.swift
//  BasketBall
//
//  Created by MAHIMA on 06/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var multipurposeButton: UIButton!
    
    //MARK:- Properties
    let configuration = ARWorldTrackingConfiguration()
    var ball = SCNNode(geometry: SCNSphere(radius: 0.05))
    //MARK:- Lifecyclew Methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.session.run(configuration)
    }

    //MARK:- IBAction
    
    @IBAction func throwTapped(_ sender: Any) {
        if multipurposeButton.tag == 0 {
            multipurposeButton.tag = 1
            let basketPlane = SCNNode(geometry: SCNPlane(width: 0.3, height: 0.3))
            let basketPole = SCNNode(geometry: SCNCylinder(radius: 0.02, height: 0.6))
            let basketRing = SCNNode(geometry: SCNTorus(ringRadius: 0.08, pipeRadius: 0.005))
            basketPole.position = SCNVector3(0, 0, -0.2)
            basketPlane.position = SCNVector3(basketPole.position.x, basketPole.position.y + 0.2 , 0.02)
            basketRing.position = SCNVector3(0, -0.07, 0.1)
            basketPole.geometry?.firstMaterial?.diffuse.contents = UIColor.black
            basketPlane.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
            basketRing.geometry?.firstMaterial?.diffuse.contents = UIColor.black
            sceneView.scene.rootNode.addChildNode(basketPole)
            basketPole.addChildNode(basketPlane)
            basketPlane.addChildNode(basketRing)
        } else {
            //Write code to throw ball
            
        }
       
        
    }
    

}

