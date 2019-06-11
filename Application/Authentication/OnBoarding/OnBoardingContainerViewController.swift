//
//  OnBoardingContainerViewController.swift
//  Test1
//
//  Created by Daniel Garcia on 6/6/19.
//  Copyright © 2019 Fredy Dominguez. All rights reserved.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else{
            return
        }
        
        destination.pageControl = pageControl
    }

}
