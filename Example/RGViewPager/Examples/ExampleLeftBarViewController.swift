//
//  ExampleLeftBarViewController.swift
//  RGViewPager
//
//  Created by Ronny Gerasch on 29.01.17.
//  Copyright © 2017 Ronny Gerasch. All rights reserved.
//

import UIKit
import RGPageViewController

class ExampleLeftBarViewController: RGPageViewController {
  override var pagerOrientation: UIPageViewControllerNavigationOrientation {
    return .vertical
  }
  
  override var tabbarPosition: RGTabbarPosition {
    return .left
  }
  
  override var tabbarStyle: RGTabbarStyle {
    return .blurred
  }
  
  override var tabIndicatorColor: UIColor {
    return UIColor.white
  }
  
  override var tabIndicatorWidthOrHeight: CGFloat {
    return DeviceType.iPad ? 4 : 2
  }
  
  override var barTintColor: UIColor? {
    return self.navigationController?.navigationBar.barTintColor
  }
  
  override var tabStyle: RGTabStyle {
    return .inactiveFaded
  }
  
  override var tabbarWidth: CGFloat {
    return 140
  }
  
  override var tabbarHidden: Bool {
    return !DeviceType.iPad
  }
  
  override var tabMargin: CGFloat {
    return 16
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    datasource = self
    delegate = self
  }
}

// MARK: - RGPageViewControllerDataSource
extension ExampleLeftBarViewController: RGPageViewControllerDataSource {
  func numberOfPages(for pageViewController: RGPageViewController) -> Int {
    return movies.count
  }
  
  func pageViewController(_ pageViewController: RGPageViewController, tabViewForPageAt index: Int) -> UIView {
    let tabView = UIImageView(frame: CGRect(x: 0, y: 0, width: 115, height: 164))
    let imageName: String = movies[index]["image"] as! String
    
    tabView.contentMode = UIViewContentMode.scaleAspectFill
    tabView.backgroundColor = UIColor.white
    
    tabView.image = UIImage(named: "\(imageName)_poster.jpg")
    
    return tabView
  }
  
  func pageViewController(_ pageViewController: RGPageViewController, viewControllerForPageAt index: Int) -> UIViewController? {
    if (movies.count == 0) || (index >= movies.count) {
      return nil
    }
    
    // Create a new view controller and pass suitable data.
    let dataViewController = storyboard!.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
    
    dataViewController.movieData = movies[index]
    
    return dataViewController
  }
}

// MARK: - RGPageViewController Delegate
extension ExampleLeftBarViewController: RGPageViewControllerDelegate {
  // use this to set a custom height for a tab
  // this is only used for vertical paging
  func pageViewController(_ pageViewController: RGPageViewController, heightForTabAt index: Int) -> CGFloat {
    return 164.0
  }
}
