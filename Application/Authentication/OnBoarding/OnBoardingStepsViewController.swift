//
//  OnBoardingStepsViewController.swift
//  Test1
//
//  Created by Daniel Garcia on 6/6/19.
//  Copyright © 2019 Fredy Dominguez. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onBoaringImage: UIImageView!
    
    var item: OnBoardingItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoaringImage.image = UIImage(named: item?.imageName ?? "")

        // Do any additional setup after loading the view.
    }

}
