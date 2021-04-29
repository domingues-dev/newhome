//
//  SplashPageViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 28/04/2021.
//

import UIKit

class SplashPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    let splashGenerator = SplashDataGenerator()
    var data: [SplashViewModel] = []
    let frameViewController = SplashViewController()
    lazy var button: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        data = splashGenerator.generateSplashScreens()
        self.dataSource = self
        let firstpage = SplashViewController()
        firstpage.data = data.first
        let secondPage = SplashViewController()
        secondPage.data = data[1]
        let thirdPage = SplashViewController()
        thirdPage.data = data.last
        let viewControllers = [firstpage, secondPage, thirdPage]
        setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}

extension SplashPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers?.firstIndex(of: viewController),
              let last = viewControllers?.last,
              let previous = viewControllers?[currentIndex - 1]
        else { return nil }
        
        if currentIndex == 0 {
            return last
        } else {
            return previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers?.firstIndex(of: viewController),
              let count = viewControllers?.count,
              let first = viewControllers?.first,
              let next = viewControllers?[currentIndex + 1]
        else { return nil }
        if currentIndex < count - 1 {
            return next
        } else {
            return first
        }
    }
    
}
