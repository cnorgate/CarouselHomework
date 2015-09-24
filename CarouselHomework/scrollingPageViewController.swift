//
//  scrollingPageViewController.swift
//  CarouselHomework
//
//  Created by Cameron Norgate on 9/24/15.
//  Copyright © 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class scrollingPageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //scrollView.contentSize = imageView.image!.size
        scrollView.contentSize = CGSize(width: 640, height: 1000)
        
        scrollView.delegate = self
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
