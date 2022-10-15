//
//  PageViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 13.10.2022.
//

import UIKit

/// Экран с данными для PageControll
final class PageViewController: UIPageViewController {
    
    // MARK: Visual Components
    private enum  FirstPageElements {
        static let firstLabel = "Track Your Cycle"
        static let secondLabel = "Manage irregular period and learnd how to improve your period."
        static let pageImage = UIImage(named: "1")
    }
    
    private enum  SecondPageElements {
        static let firstLabel = "Plan Your Pregnancy"
        static let secondLabel = "Favorable days are important. Vestibulum rutrum quam vitac fringila  tincidunt."
        static let pageImage = UIImage(named: "2-1")
    }
    
    private enum  ThirdPageElements {
        static let firstLabel = "Daily Health Insight"
        static let secondLabel = "Personal healt insight. Vestibulum rutrum quam vitae frimgilla tincidunt."
        static let pageImage = UIImage(named: "3")
    }
    
    private enum TitleForButton {
        static let skipButton = "SKIP"
        static let nextButton = "NEXT"
        static let getStartedButton = "GET STARTED!"
    }
    
    // MARK: Private properties
    private let firstPhoto = FirstPageElements.pageImage
    private let secondPhoto = SecondPageElements.pageImage
    private let thredPhoto = ThirdPageElements.pageImage
    private var elementsOfPageVC: [ElementsPageControl] = [ElementsPageControl]()
    private var pageControlAppearance = UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self])
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 95, y: 831, width: 50, height: 40))
        button.setTitle(TitleForButton.skipButton, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(getStartedAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 270, y: 831, width: 50, height: 40))
        button.setTitle(TitleForButton.nextButton, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(nextPageAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 0, y: 831, width: 150, height: 40))
        button.setTitle(TitleForButton.getStartedButton, for: .normal)
        button.isHidden = true
        button.backgroundColor = .white
        button.center.x = view.center.x
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(getStartedAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var pages: [UIViewController] = {
        var photoVC: [UIViewController] = [UIViewController]()
        for elements in elementsOfPageVC {
            photoVC.append(InfoViewController(elements: elements))
        }
        return photoVC
    }()
    
    // MARK: Initializers
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = .white
        self.dataSource = self
        self.delegate = self
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: @Objc private action
    @objc private func getStartedAction(sender: UIButton) {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(1, forKey: "user")
    }
    
    @objc private func nextPageAction(sender: UIButton) {
        guard let currentVC = viewControllers?.first,
              let nextVC = dataSource?.pageViewController(self, viewControllerAfter: currentVC),
              let pageControl = view.subviews.first(where: { $0 is UIPageControl }) as? UIPageControl else { return }
        
        let index = pageControl.currentPage
        if nextVC == pages.last {
            skipButton.isHidden = true
            nextButton.isHidden = true
            getStartedButton.isHidden = false
            togglePageControl(isHidden: true)
        }
        setViewControllers([nextVC],
                           direction: .forward,
                           animated: true)
        pageControl.currentPage += index + 1
    }
    
    // MARK: Private Methods
    private func setUI() {
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(getStartedButton)
        pageControlAppearance.pageIndicatorTintColor = .tertiaryLabel
        pageControlAppearance.currentPageIndicatorTintColor = .systemBlue
        addElementsInPage()
    }
    
    private func addElementsInPage() {
        let firstPageVC = ElementsPageControl(
            firstLabel: FirstPageElements.firstLabel,
            secondLabel: FirstPageElements.secondLabel,
            image: firstPhoto ?? UIImage())
        
        let secondsPageVC = ElementsPageControl(
            firstLabel: SecondPageElements.firstLabel,
            secondLabel: SecondPageElements.secondLabel,
            image: SecondPageElements.pageImage ?? UIImage())
        
        let thridPageVC = ElementsPageControl(
            firstLabel: ThirdPageElements.firstLabel,
            secondLabel: ThirdPageElements.secondLabel,
            image: ThirdPageElements.pageImage ?? UIImage())
        
        elementsOfPageVC.append(firstPageVC)
        elementsOfPageVC.append(secondsPageVC)
        elementsOfPageVC.append(thridPageVC)
    }
    
    private func togglePageControl(isHidden: Bool) {
        for subView in view.subviews where subView is UIPageControl {
            subView.isHidden = isHidden
        }
    }
}

// MARK: PageViewController + UIPageViewControllerDelegate, UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InfoViewController else { return nil }
        if let index = pages.firstIndex(of: viewController) {
            if index > 0 {
                return pages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InfoViewController else { return nil }
        if let index = pages.firstIndex(of: viewController) {
            if index < elementsOfPageVC.count - 1 {
                return pages[index + 1]
            } else {
                return pages.first
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return elementsOfPageVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            
            guard let viewControllers = pageViewController.viewControllers else { return }
            guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
            pageControlAppearance.currentPage = currentIndex
            if currentIndex == 0 || currentIndex == 1 {
                skipButton.isHidden = false
                nextButton.isHidden = false
                getStartedButton.isHidden = true
                togglePageControl(isHidden: false)
            } else {
                
                skipButton.isHidden = true
                nextButton.isHidden = true
                getStartedButton.isHidden = false
                togglePageControl(isHidden: true)
            }
        }
}
