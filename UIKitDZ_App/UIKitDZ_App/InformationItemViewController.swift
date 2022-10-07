//
//  InformationItemViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 06.10.2022.
//

import UIKit
/// Информация о товаре
final class InformationItemViewController: UIViewController {
    
    // MARK: Public properties
    let nameOfItem: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20,
            y: 110,
            width: 400,
            height: 30))
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
     let photoOfItemImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 50,
            y: 200,
            width: 300,
            height: 200))
         imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: Private Methods
    private func setView() {
        view.backgroundColor = .black
        view.addSubview(nameOfItem)
        view.addSubview(photoOfItemImage)
    }
}
