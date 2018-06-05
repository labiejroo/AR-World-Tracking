//
//  ViewController.swift
//  WorldTracking
//
//  Created by Machine Horizon on 23/02/2018.
//  Copyright © 2018 Machine Horizon. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
    
        
        
        let parent = SCNNode()
        parent.position = SCNVector3(0,0,-0.5)
        self.sceneView.scene.rootNode.addChildNode(parent)
        
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.5, height: 0.01, length: 0.1, chamferRadius: 0)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(0,0,0)
        parent.addChildNode(node)
        
        let capusle = SCNNode()
        capusle.geometry = SCNCapsule(capRadius: 0.4, height: 0.2)
        capusle.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        capusle.position = SCNVector3(0,0.2,-1)
        self.sceneView.scene.rootNode.addChildNode(capusle)

        let cone = SCNNode()
        cone.geometry = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 0.5)
        cone.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        cone.position = SCNVector3(0,0,-2)
        self.sceneView.scene.rootNode.addChildNode(cone)

        let cylinder = SCNNode()
        cylinder.geometry = SCNCylinder(radius: 0.5, height: 0.5)
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        cylinder.position = SCNVector3(0,0,-3)
        self.sceneView.scene.rootNode.addChildNode(cylinder)

        let tube = SCNNode()
        tube.geometry = SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.5)
        tube.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        tube.position = SCNVector3(1,0,-1)
        self.sceneView.scene.rootNode.addChildNode(tube)

        let torus = SCNNode()
        torus.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.2)
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
        torus.position = SCNVector3(1,0,-2)
        self.sceneView.scene.rootNode.addChildNode(torus)

        let plane = SCNNode()
        plane.geometry = SCNPlane(width: 0.3, height: 0.3)
        plane.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        plane.position = SCNVector3(1,0,-3)
        self.sceneView.scene.rootNode.addChildNode(plane)

        let pyramid = SCNNode()
        pyramid.geometry = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramid.position = SCNVector3(-1,0,-1)
        self.sceneView.scene.rootNode.addChildNode(pyramid)

        let newNode = SCNNode()
        let path = UIBezierPath()
        path.move(to:  CGPoint(x : 0,y : 0))
        path.addLine(to: CGPoint(x: 0,y: 0.3))
        path.addLine(to: CGPoint(x:0.5,y:1))
        path.addLine(to: CGPoint(x:0.5,y:-0.2))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        newNode.geometry = shape
        newNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        newNode.position = SCNVector3(-1,0,-3)
        self.sceneView.scene.rootNode.addChildNode(newNode)


    }
    
    @IBAction func ResetButton(_ sender: Any) {
        
        ResetScene()
    }
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    func ResetScene(){
        
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
}

