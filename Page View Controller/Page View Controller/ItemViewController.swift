//
//  ItemViewController.swift
//  Page View Controller
//
//  Created by apple on 20/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
  var flag = 0
    // CGFloat imageviewWidth = 0
  
     var imageViewWidth: CGFloat = 0.0
    var imageViewHeight: CGFloat
        = 0.0
    @IBAction func imgTapped(_ sender: Any)
    {
        let img = imageView
        if flag == 0
        {
            imageViewWidth = img!.frame.width
            imageViewHeight = img!.frame.height
            
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        flag = 1
            
        }
            
        else
        {
           
            let screenWidth = imageViewWidth
            let screenHeight = imageViewHeight
            imageView.frame = CGRect(x: 0, y: 45, width: screenWidth, height: screenHeight)
            
            
            
            
            
           flag = 0
        }
        
        
        
        
    }
    
    
    var index: Int = 0
  //  var images : [UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!]
    var imageName : String = "" {
        didSet{
           if let image = imageView
        {
            image.image = UIImage(named: imageName)
        }
        }
    }
    
    
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
