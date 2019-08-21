//
//  SwiftTrainingVC.swift
//  iOSKnowledgeTrain
//
//  Created by work on 2019/8/20.
//  Copyright © 2019 work. All rights reserved.
//

import UIKit

class SwiftTrainingVC: UIViewController {

    @IBOutlet weak var pig: UIImageView!
    
    @IBOutlet weak var wolf: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func goLeft(_ sender: Any) {
        
        pig.image = UIImage.init(named: "pig")
        pig.frame.origin.x -= 20
        
        if pig.frame.origin.x<wolf.frame.origin.x {
            wolf.frame.origin.x -= 20
        }
        if pig.frame.origin.x>wolf.frame.origin.x
           {wolf.frame.origin.x += 20
            
        }
        if wolf.frame.origin.y<pig.frame.origin.y
        {
            wolf.frame.origin.y+=20
        }
        if wolf.frame.origin.y>pig.frame.origin.y
        {
            wolf.frame.origin.y-=20
        }
        //wolf.frame.origin.x += 20
        
    }
    
    
    @IBAction func goRight(_ sender: Any) {
        
        let tempimage:UIImage! = UIImage.init(named: "pig")
        if pig.frame.origin.x<wolf.frame.origin.x {
            wolf.frame.origin.x -= 20
        }
        if pig.frame.origin.x>wolf.frame.origin.x
        {wolf.frame.origin.x += 20
            
        }
        if wolf.frame.origin.y<pig.frame.origin.y
        {
            wolf.frame.origin.y+=20
        }
        if wolf.frame.origin.y>pig.frame.origin.y
        {
            wolf.frame.origin.y-=20
        }
        pig.image=self.flip(img: tempimage)
        pig.frame.origin.x += 20
    }
    
    
    @IBAction func goUp(_ sender: Any) {
        pig.frame.origin.y -= 20
        
        if wolf.frame.origin.y<pig.frame.origin.y
        {
            wolf.frame.origin.y+=20
        }
        if wolf.frame.origin.y>pig.frame.origin.y
        {
            wolf.frame.origin.y-=20
        }
        if pig.frame.origin.x<wolf.frame.origin.x {
            wolf.frame.origin.x -= 20
        }
        if pig.frame.origin.x>wolf.frame.origin.x
        {
            wolf.frame.origin.x += 20    
        }
    }
    
    @IBAction func goDown(_ sender: Any) {
        pig.frame.origin.y += 20
        if wolf.frame.origin.y<pig.frame.origin.y
        {
            wolf.frame.origin.y+=10
        }
        if wolf.frame.origin.y>pig.frame.origin.y
        {
            wolf.frame.origin.y-=10
        }
        if pig.frame.origin.x<wolf.frame.origin.x {
            wolf.frame.origin.x -= 20
        }
        if pig.frame.origin.x>wolf.frame.origin.x
        {wolf.frame.origin.x += 20
            
        }
    }
    
    
    
    //翻转
    func flip(img:UIImage)->UIImage{
        UIGraphicsBeginImageContextWithOptions(img.size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.scaleBy(x: -1, y: 1)
        ctx?.translateBy(x: -img.size.width, y: 0)
        img.draw(in: CGRect(origin: .zero, size: img.size))
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    
}
