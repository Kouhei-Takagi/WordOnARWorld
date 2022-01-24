//
//  ViewController.swift
//  WordOnARWorld
//
//  Created by 高木耕平 on 2018/05/30.
//  Copyright © 2018年 高木耕平. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate{

    @IBOutlet var sceneView: ARSCNView!
    
    var text1: String!
    var text2: String!
    var text3: String!
    
    var textResult: String!
    
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        let targetImage = sceneView.snapshot() as UIImage
        UIImageWriteToSavedPhotosAlbum(targetImage, self, nil, nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textResult = "\(text1!)" + "\r\(text2!)" + "\r\(text3!)"
        
        //self.sceneView = ARSCNView(frame: self.view.frame)
        //self.view.addSubview(self.sceneView)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        let textGeometry = SCNText.init(string: textResult, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.white
        
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(-0.3,0.0,-0.9)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        
        scene.rootNode.addChildNode(textNode)
        
        // Set the scene to the view
        sceneView.scene = scene
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = AROrientationTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}



