//
//  ViewController.swift
//  CALoadingIndicatorView
//
//  Created by Christian Abella  on 17/11/2015.
//  Copyright © 2015 TheUsefulApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  let indicatorView = CALoadingIndicatorView()
  let indicatorViewRandom = CALoadingIndicatorView()
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let width = UIScreen.mainScreen().bounds.width
    let height = self.view.frame.size.height

    self.view.addSubview(indicatorView)
    self.view.addSubview(indicatorViewRandom)
    
    // Call setIndicatorDefaultColor if you just want to use specific color
    indicatorView.frame = CGRectMake(width/2-50,height/2,100,50)
    indicatorView.setIndicatorDefaultColor(UIColor.greenColor())
    indicatorView.setIndicatorRadius(10.0)
    indicatorView.setIndicatorNumberOfCircles(5)
    indicatorView.startAnimating()
    
    indicatorViewRandom.frame = CGRectMake(width/2-50,height/2 + 100,100,50)
    indicatorViewRandom.setIndicatorRadius(10.0)
    indicatorViewRandom.setIndicatorNumberOfCircles(8)
    indicatorViewRandom.startAnimating()

    
    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("handleTap:")))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  func handleTap(sender : AnyObject?)
  {
    if indicatorView.isAnimating
    {
      indicatorView.stopAnimating()
    }
    else
    {
      indicatorView.startAnimating()
    }
    
    if indicatorViewRandom.isAnimating
    {
      indicatorViewRandom.stopAnimating()
    }
    else
    {
      indicatorViewRandom.startAnimating()
    }
  }
}

