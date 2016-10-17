//
//  ViewController.swift
//  Swift-ViewAnimationDemo
//
//  Created by 权仔 on 2016/10/12.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var couldOne: UIImageView!
    
    @IBOutlet weak var couldTwo: UIImageView!
    
    @IBOutlet weak var couldThree: UIImageView!
    
    @IBOutlet weak var couldFour: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var status: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var statusPostion = CGPoint.zero
    
    let messages: [String] = ["Connection...", "Failed"]
    
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heading.center.x -= view.bounds.width
        username.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        couldOne.alpha = 0.0
        couldTwo.alpha = 0.0
        couldThree.alpha = 0.0
        couldFour.alpha = 0.0
        
        loginButton.center.y += 30.0
        loginButton.alpha = 0.0
        
        loginButton.addSubview(spinner)
        
        statusPostion = status.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let duration = 0.5
        
        UIView.animate(withDuration: duration) {
            self.heading.center.x += self.view.bounds.width
            self.username.center.x += self.view.bounds.width
            self.password.center.x += self.view.bounds.width
        }
        
        UIView.animate(withDuration: duration,
                       delay: 0.3,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
            self.username.center.x += self.view.bounds.width
            }, completion: nil)

        UIView.animate(withDuration: duration,
                       delay: 0.4,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: duration,
                       delay: 0.5,
                       options: [],
                       animations: { 
                        self.couldOne.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: duration,
                       delay: 0.7,
                       options: [],
                       animations: {
                        self.couldTwo.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: duration,
                       delay: 0.9,
                       options: [],
                       animations: {
                        self.couldThree.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: duration,
                       delay: 1.1,
                       options: [],
                       animations: {
                        self.couldFour.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.0,
                       options: [], animations: {
                        self.loginButton.center.y -= 30.0
                        self.loginButton.alpha = 1.0
            }, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.0,
                       options: [], animations: {
                        self.loginButton.bounds.size.width += 80.0
        }) { (true) in

        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: { 
                        self.loginButton.center.y += 100.0
        }) { (true) in
        }
        
        UIView.animate(withDuration: 0.5,
                       animations: { 
                        self.loginButton.backgroundColor = UIColor(colorLiteralRed: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
            },completion: { (true) in

        })
        
        self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height / 2)
        self.spinner.alpha = 1.0
        self.spinner.startAnimating()
    }

    // 有个问题：在动画开始前loginButton会恢复到动画前状态，还未找到解决方法
    func showMessage(index: Int) {
        label.text = messages[index]
        
        UIView.transition(with: status,
                          duration: 0.33,
                          options: [.curveEaseOut, .transitionCurlDown],
                          animations: { 
                            self.status.isHidden = false
                            self.spinner.isHidden = false
        }) { (true) in
            if index < self.messages.count - 1 {
                self.removeMessage(index: index)
            } else {
                
            }
        }
    }
    
    func removeMessage(index: Int) {
        UIView.animate(withDuration: 0.33,
                       delay: 1.0, options: [], animations: {
                        self.status.center.x += self.view.frame.size.width
            }) { (true) in
                self.status.isHidden = true
                self.status.center = self.statusPostion
                
                self.showMessage(index: index + 1)
                self.spinner.isHidden = true
                
//                self.resetForm()
        }
    }
    
    func resetForm() {
        UIView.transition(with: status,
                          duration: 0.2,
                          options: [.curveEaseIn, .transitionCurlUp],
                          animations: { 
                            self.status.isHidden = true
                            self.loginButton.center = self.statusPostion
            }) { (true) in
                
        }
        
        UIView.animate(withDuration: 0.2,
                       delay: 1.0,
                       options: [],
                       animations: { 
                        self.spinner.alpha = 0.0
            }) { (Bool) in
                
        }
        
    }
    
    func animateCloud(cloud: UIImageView) {
      // TODO...
    }
    
    func fadeImageView(imageView: UIImageView, toImage: UIImage, showEffects: Bool) {
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { 
                            imageView.image = toImage
            }) { (Bool) in
                
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

