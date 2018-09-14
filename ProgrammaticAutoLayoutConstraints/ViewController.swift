//
//  ViewController.swift
//  ProgrammaticAutoLayoutConstraints
//
//  Created by Liam Flaherty on 9/13/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let DVDImage = UIImageView(image: #imageLiteral(resourceName: "alien"))
    let background = UIImageView(image: #imageLiteral(resourceName: "takeoff"))
    
    let screenWidth  = (UIScreen.main.fixedCoordinateSpace.bounds.width)
    let screenHeight = (UIScreen.main.fixedCoordinateSpace.bounds.height)
    
    @IBOutlet weak var btnConBL: UIButton!
    @IBOutlet weak var btnConBR: UIButton!
    @IBOutlet weak var btnConTR: UIButton!
    @IBOutlet weak var btnCon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        view.addSubview(background)
        background.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        background.heightAnchor.constraint(equalToConstant: screenHeight).isActive = true
        background.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        background.frame.size.height = screenHeight
        background.frame.size.width = screenWidth
        background.addSubview(DVDImage)
        view.bringSubview(toFront: btnConBR)
        view.bringSubview(toFront: btnCon)
        view.bringSubview(toFront: btnConTR)
        view.bringSubview(toFront: btnConBL)
      
        
        
        DVDImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        DVDImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        DVDImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        DVDImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        DVDImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setButtonConstraints(button: btnCon, xVal: 0, yVal: 0, height : 50, width : 100)
        setButtonConstraints(button: btnConTR, xVal: Int(screenWidth)-100, yVal: 0,height : 50, width : 100)
        setButtonConstraints(button: btnConBL, xVal: 0, yVal: Int(screenHeight)-50, height : 50, width : 100)
        setButtonConstraints(button: btnConBR, xVal: Int(screenWidth)-100, yVal: Int(screenHeight)-50, height : 50, width : 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MoveTM1(_ sender: Any) {
        setButtonConstraints(button: DVDImage, xVal: Int(screenWidth)-Int(DVDImage.frame.size.width), yVal: 0, height : Int(DVDImage.frame.size.height), width : Int(DVDImage.frame.size.width))
    }
    
    @IBAction func MoveTM2(_ sender: Any) {
        setButtonConstraints(button: DVDImage, xVal: Int(screenWidth)-Int(DVDImage.frame.size.width), yVal: Int(screenHeight)-Int(DVDImage.frame.size.height), height : Int(DVDImage.frame.size.height), width : Int(DVDImage.frame.size.width))
    }
    
    @IBAction func MoveTM3(_ sender: Any) {
        setButtonConstraints(button: DVDImage, xVal: 0, yVal: Int(screenHeight)-Int(DVDImage.frame.size.height), height : Int(DVDImage.frame.size.height), width : Int(DVDImage.frame.size.width))
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        setButtonConstraints(button: DVDImage, xVal: 0, yVal: 0, height : Int(DVDImage.frame.size.height), width : Int(DVDImage.frame.size.width))
    }
    
    func setButtonConstraints(button : UIView, xVal : Int, yVal : Int, height : Int, width : Int){
        button.frame = CGRect(x: xVal, y: yVal, width: width, height: height)
    }
    

}

