//
//  IntroViewController.swift
//  CarouselHomework
//
//  Created by Cameron Norgate on 9/22/15.
//  Copyright © 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    var image1OriginalPosition : CGPoint!
    var image2OriginalPosition : CGPoint!
    var image3OriginalPosition : CGPoint!
    var image4OriginalPosition : CGPoint!
    var image5OriginalPosition : CGPoint!
    var image6OriginalPosition : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        scrollView.contentSize =  CGSize(width: 320, height: 1000)
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        image1OriginalPosition = image1.center
        image2OriginalPosition = image2.center
        image3OriginalPosition = image3.center
        image4OriginalPosition = image4.center
        image5OriginalPosition = image5.center
        image6OriginalPosition = image6.center
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var x : CGFloat = 588 - (scrollView.contentOffset.y + 20)
        var y : CGFloat = scrollView.contentOffset.y + 20
        var scrollPercent : CGFloat = y/588
        var scrollInverse : CGFloat = x/588
        
        var factor : CGFloat = 1.42
        
        image1.center.y = image1OriginalPosition.y + y / factor
        image1.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2.7) * scrollInverse)
        
        image2.center.y = image2OriginalPosition.y + y / factor
        image2.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 * 0.3) * scrollInverse)
        
        image3.center.y = image3OriginalPosition.y + y / factor
        image3.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 1.5) * scrollInverse)
        
        image4.center.y = image4OriginalPosition.y + y / factor
        image4.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 * 0.7) * scrollInverse)
        
        image5.center.y = image5OriginalPosition.y + y / factor
        image5.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 * 0.5) * scrollInverse)
        
        image6.center.y = image6OriginalPosition.y + y / factor
        image6.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 * 0.5) * (-scrollInverse))
        
        
        print(x)
        print(y)
        print(scrollPercent)
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
