//
//  OnboardingViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 29/04/2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    let pageDataGenerator = SplashDataGenerator()
    var data: [SplashViewModel] = []
    var pages: [UIViewController] = []
    let initialPage = 0
    
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.view.backgroundColor = AppColors.white
        return pageViewController
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = AppColors.darkBlue
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPage = initialPage
        pageControl.addTarget(self, action: #selector(pageControlTaped(_:)), for: .valueChanged)
        return pageControl
    }()
    
    lazy var skipButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(AppColors.white, for: .normal)
        btn.backgroundColor = AppColors.darkBlue
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        setupPageViewController()
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        setupSkipButton()
        setupNextButton()
    }
    
    fileprivate func setupPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
            
        ])
        
        pageViewController.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            pageControl.widthAnchor.constraint(equalTo: pageViewController.view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        data = pageDataGenerator.generateSplashScreens()
        for i in 0...(data.count - 1) {
            let vc = PageViewController()
            vc.data = data[i]
            pages.append(vc)
        }
        
        pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true)
        pageControl.numberOfPages = pages.count
    }
    
    fileprivate func setupSkipButton() {
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: pageViewController.view.topAnchor, constant: -10),
            skipButton.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            skipButton.widthAnchor.constraint(equalToConstant: 50),
            skipButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    fileprivate func setupNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: pageViewController.view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func pageControlTaped(_ sender: UIPageControl) {
        pageViewController.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
    }
    
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController)
        else { return nil }
        
        if currentIndex == 0 {
            return nil
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController)
        else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
    
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers,
              let currentIndex = pages.firstIndex(of: viewControllers[0])
              else { return }
        
        pageControl.currentPage = currentIndex
    }
    
}
