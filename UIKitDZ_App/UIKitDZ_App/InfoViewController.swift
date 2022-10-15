//
//  PhotoViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 13.10.2022.
//

import UIKit

/// Класс для принятия данных с класса PageViewController
final class InfoViewController: UIViewController {

    // MARK: Private Methods
    private let pageImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 0, y: 550, width: 300, height: 200))
        label.textColor = .black
        label.numberOfLines = 3
        label.alpha = 0.0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 0, y: 600, width: 350, height: 200))
        label.textColor = UIColor(red: 129.0 / 255, green: 129.0 / 255, blue: 129.0 / 255, alpha: 1.0)
        label.numberOfLines = 3
        label.alpha = 0.0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var subView: [UIView] = [self.pageImage, self.firstLabel, self.secondLabel]
    
    // MARK: Init
    init(elements: ElementsPageControl) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .black
        edgesForExtendedLayout = []
        
        pageImage.image = elements.image
        firstLabel.text = elements.firstLabel
        secondLabel.text = elements.secondLabel
        
        for view in subView { self.view.addSubview(view) }
        
        pageImage.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        firstLabel.center.x = view.center.x
        secondLabel.center.x = view.center.x
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.firstLabel.alpha = 1.0
            self.secondLabel.alpha = 1.0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.firstLabel.alpha = 0.0
        self.secondLabel.alpha = 0.0
    }
}
