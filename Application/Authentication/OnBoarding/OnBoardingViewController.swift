//
//  OnBoardingViewController.swift
//  Test1
//
//  Created by Daniel Garcia on 6/6/19.
//  Copyright © 2019 Fredy Dominguez. All rights reserved.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {

    var pageControl: UIPageControl?
    
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Imagen de Apple en negro",
                description: "Presiona el boton",
                imageName: "Image3"
            ),
            
            OnBoardingItem(
                title: "Imagen de Apple en plateado",
                description: "Presiona el boton",
                imageName: "Image2"
            )
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instanteViewController(i))
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = items.count
    }
    
    func updateContainerView(stepNumber index: Int){
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }
    
    func instanteViewController(_ index: Int) -> UIViewController{
        guard let viewController = UIStoryboard(name: "onBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else{
            return UIViewController()
        }
        
        viewController.item = items[index]
        return viewController
    }

}
 //Metodos
extension OnBoardingViewController : UIPageViewControllerDataSource{
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0{
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    
    
}

extension OnBoardingViewController : UIPageViewControllerDelegate{
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        
        guard let index = contentViewController.firstIndex(of: viewControllers!.first!) else {
            return
        }
        
        pageControl?.currentPage = index
    }
}
