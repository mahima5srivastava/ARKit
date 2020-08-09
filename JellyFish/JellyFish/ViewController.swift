//
//  ViewController.swift
//  JellyFish
//
//  Created by MAHIMA on 09/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //MARK:- Properties
    let configiration = ARWorldTrackingConfiguration()
 
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.session.run(configiration)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (handleTap))
        self.sceneView.gestureRecognizers = [tapGestureRecognizer]
    }
    
    
    //MARK:- IBaction
    @IBAction func reset(_ sender: Any) {
    }
    
    @IBAction func play(_ sender: Any) {
        addNode()
    }
    
    //MARK:- Private Methods
    private func addNode() {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.02, height: 0.02, length: 0.02, chamferRadius: 0.01)
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
    //MARK:- objc Methods
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
       
        guard  let sceneTappedOn = sender.view as? SCNView else {return}
        print(sceneTappedOn)
        print(nodePosition2D)
        if !result.isEmpty {
            print("tapped on box")
        } else {
            print("tapped outside box")
        }
        
    }
}

