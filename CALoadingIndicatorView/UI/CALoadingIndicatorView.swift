//
//  LoadingIndicatorView.swift
//  Aware
//
//  Created by Christian Abella  on 17/11/2015.
//  Copyright © 2015 Mipela Geo Solutions. All rights reserved.
//

import Foundation
import UIKit

class CALoadingIndicatorView  : UIView
{
  /** The number of circle indicators. */
  var numberOfCircles : Int = 0
  
  /** The spacing between circles. */
  var internalSpacing : CGFloat = 0.0
  
  /** The radius of each circle. */
  var radius : CGFloat = 0.0
  
  /** The base animation delay of each circle. */
  var delay : CGFloat = 0.0
  
  /** The base animation duration of each circle*/
  var duration : CGFloat = 0.0
  
  /** The boolean flag if animation is currently active */
  var isAnimating : Bool = false
  var useRandomColors = true
  
  var defaultColor : UIColor!
  
  init()
  {
    super.init(frame: CGRectZero)
    setupDefaults()
  }
  
  override init(frame: CGRect)
  {
    super.init(frame: frame)
    setupDefaults()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setupDefaults()
  }
  
  func setupDefaults()
  {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.numberOfCircles = 5
    self.internalSpacing = 5
    self.radius = 10
    self.delay = 0.2
    self.duration = 0.8
    self.defaultColor = UIColor.greenColor()
  }
  
  func setIndicatorNumberOfCircles(numberOfCircles : Int)
  {
    self.numberOfCircles = numberOfCircles
    self.invalidateIntrinsicContentSize()
  }
  
  func setIndicatorRadius(radius : CGFloat)
  {
    self.radius = radius
    self.invalidateIntrinsicContentSize()
  }
  
  func setIndicatorInternalSpacing(internalSpacing : CGFloat)
  {
    self.internalSpacing = internalSpacing
    self.invalidateIntrinsicContentSize()
  }
  
  func setIndicatorDefaultColor(defaultColor : UIColor)
  {
    self.defaultColor = defaultColor
    self.useRandomColors = false
    self.invalidateIntrinsicContentSize()
  }
  
  func createCircleWithRadius(radius :CGFloat, color : UIColor, x : CGFloat) -> UIView!
  {
    let circle = UIView.init(frame: CGRectMake(x, 0, radius * 2, radius * 2))
    circle.backgroundColor = color
    circle.layer.cornerRadius = radius
    circle.translatesAutoresizingMaskIntoConstraints = false
    
    return circle
  }
  
  func createAnimationWithDuration(duration : CGFloat, delay: CGFloat) -> CABasicAnimation!
  {
    let anim = CABasicAnimation(keyPath: "transform.scale")
    anim.delegate = self
    anim.fromValue = 0.0
    anim.toValue = 1.0
    anim.autoreverses = true
    anim.duration = CFTimeInterval(duration)
    anim.removedOnCompletion = false
    anim.beginTime = CFTimeInterval(CACurrentMediaTime()) + CFTimeInterval(delay)
    anim.repeatCount = 10000
    anim.timingFunction =  CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    return anim
  }

  func addCircles()
  {
    for var i = 0; i < self.numberOfCircles; i++
    {
      let color : UIColor! = self.useRandomColors ? self.getRandomColor() : self.defaultColor
      let circleRadius : CGFloat = CGFloat(i) * ((2 * self.radius) + self.internalSpacing)
      let circle = createCircleWithRadius(self.radius, color: color, x: circleRadius)
      
      circle.transform = CGAffineTransformMakeScale(0, 0)
      circle.layer.addAnimation(createAnimationWithDuration(self.duration, delay: CGFloat(i) * self.delay), forKey: "scale")
      self.addSubview(circle)
    }
  }
  
  func removeCircles()
  {
    for view in self.subviews
    {
      view.removeFromSuperview()
    }
  }
  
  func startAnimating()
  {
    if !self.isAnimating
    {
      self.addCircles()
      self.hidden = false
      self.isAnimating = true
    }
  }
  
  
  func stopAnimating()
  {
    if self.isAnimating
    {
      self.removeCircles()
      self.hidden = true
      self.isAnimating = false
    }
  }
  
  func getRandomColor() -> UIColor!
  {
    let red   = Float((arc4random() % 256)) / 255.0
    let green = Float((arc4random() % 256)) / 255.0
    let blue  = Float((arc4random() % 256)) / 255.0
    let alpha = Float(1.0)
    return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
  }

}