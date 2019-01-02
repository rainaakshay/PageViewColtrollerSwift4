//
//  ViewController.swift
//  Page View Controller
//
//  Created by apple on 20/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ItemViewController
        if itemController.index > 0
       {
        return getItemController(itemController.index-1)
        }
        
      
        return nil
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ItemViewController
        if itemController.index+1 < images.count
        {
            return getItemController(itemController.index+1)
        }
        return nil
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
    func currentIndex() -> Int {
        let pageItemController = self.currentIndex()
        if let controller = pageItemController as? ItemViewController
        {
            return controller.index
        }
        return -1
    }
    
    
    
    func currentController() -> UIViewController? {
        if (self.pageViewController?.viewControllers?.count)! > 0
        {
            return self.pageViewController?.viewControllers![0]
        }
        return nil
    }
    
    
    
    func getItemController(_ index: Int) -> ItemViewController?{
        if index < images.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "ItemController") as! ItemViewController
            pageItemController.index = index
            pageItemController.imageName = images[index]
            return pageItemController
        }
        return nil
    }
    
    
    
    var pageViewController : UIPageViewController?
    let images = ["1","2","3","4","5","6","7","8","9","10","11"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        create()
           set()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func create()
        {
            let pageController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
            pageController.dataSource=self
            if(images.count > 0)
            {
                let firstController = getItemController(0)
                let start = [firstController]
                pageController.setViewControllers(start as? [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
                
            }
            pageViewController=pageController
            addChild(pageController)
            self.view.addSubview((pageViewController?.view)!)
            pageViewController?.didMove(toParent: self)
            
            
            }
    
    
    
    func set()
        {
            let appearance = UIPageControl.appearance()
            appearance.pageIndicatorTintColor=UIColor.black
            appearance.currentPageIndicatorTintColor = UIColor.blue
            appearance.backgroundColor=UIColor.darkGray

            }
    
    

}

