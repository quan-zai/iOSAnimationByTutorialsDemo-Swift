//
//  KeyframeAnimationsControllerViewController.swift
//  Swift-ViewAnimationDemo
//
//  Created by 权仔 on 2016/10/17.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class KeyframeAnimationsControllerViewController: UIViewController {

    let planeImage: UIImageView = UIImageView(image: UIImage(named: "plane"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planeImage.frame = CGRect(x: 50, y: 200, width: 50, height: 50)
        view.addSubview(planeImage)
        
        planeDepart()
    }

    func planeDepart() {
        let originalCenter = planeImage.center
        
        UIView.animateKeyframes(withDuration: 2.5,
                                delay: 0.0,
                                options: [],
                                animations: { 
                                    // add keyframes
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.25,
                                                       animations: { 
                                                        self.planeImage.center.x += 80.0
                                                        self.planeImage.center.y -= 10
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.1,
                                                       relativeDuration: 0.4,
                                                       animations: { 
                                                        self.planeImage.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_4 / 2))
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.25,
                                                       animations: { 
                                                        self.planeImage.center.x += 100.0
                                                        self.planeImage.center.y -= 50.0
                                                        self.planeImage.alpha = 0.0
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.51,
                                                       relativeDuration: 0.01,
                                                       animations: { 
                                                        self.planeImage.transform = CGAffineTransform.identity
                                                        self.planeImage.center = CGPoint(x: 0.0, y: originalCenter.y)
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.55,
                                                       relativeDuration: 0.45,
                                                       animations: { 
                                                        self.planeImage.alpha = 1.0
                                                        self.planeImage.center = originalCenter
                                    })
                                    
                                    
            },
                                completion: nil)
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
