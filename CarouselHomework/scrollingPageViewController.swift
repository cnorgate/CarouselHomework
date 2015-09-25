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
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var tryCarousel: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //scrollView.contentSize = imageView.image!.size
        scrollView.contentSize = CGSize(width: 320 * 4, height: 568)
        
        scrollView.delegate = self
        
        tryCarousel.alpha = 0
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.tryCarousel.alpha = 1
                self.pageControl.alpha = 0
            })

        } else {
            self.tryCarousel.alpha = 0
            self.pageControl.alpha = 1
        }
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
