#CALoadingIndicatorView for Swift 2.0

An animated loading indicator derived from UIView.
Can customise the number of circles, width, and delay.
Written in Swift 2.0

![example](https://github.com/kabilya/CALoadingIndicatorView/blob/master/demo.gif?raw=true)

## Requirements

* iOS 7.0 or later.
* ARC memory management.

## Installation

The easiest way to install it is by copying the following file to your project:

* CALoadingIndicatorView.swift

## Usage


  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let indicatorView = CALoadingIndicatorView()
    let indicatorViewRandom = CALoadingIndicatorView()
  
    self.view.addSubview(indicatorView)
    self.view.addSubview(indicatorViewRandom)
    
    let width = UIScreen.mainScreen().bounds.width
    let height = self.view.frame.size.height

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
  }

