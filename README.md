Animated Loading Indicator View for Swift 2.0

Usage:

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

