 //
//  TabBarViewController.swift
//  Test1
//
//  Created by Daniel Garcia on 6/7/19.
//  Copyright © 2019 Fredy Dominguez. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customButton()
    }
    
    func customButton(){
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        
        var menuButtonFrame = menuButton.frame
        
        menuButtonFrame.origin.y = tabBar.frame.origin.y
        menuButtonFrame.origin.x = view.bounds.width / 2 - menuButtonFrame.size.width / 2
        
        menuButton.frame = menuButtonFrame
        
        menuButton.setImage(UIImage(named: "Icono3"), for: .normal)
        
        menuButton.backgroundColor = UIColor(named: "GreenColor")
        menuButton.layer.cornerRadius = 8
        view.addSubview(menuButton)
        
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func menuButtonAction(sender: UIButton){
        selectedIndex = 2
    }
}
