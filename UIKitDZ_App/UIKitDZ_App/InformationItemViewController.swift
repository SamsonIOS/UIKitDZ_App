//
//  InformationItemViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 06.10.2022.
//

import UIKit

/// Информация о товаре
final class InformationItemViewController: UIViewController {
    
    // MARK: Visual Components
    private enum Constants {
        static let compatibilityTextLabel = "Совместимо с MacBook Pro - Евгений"
        static let firstInfoLabel = "Заказ сегодня в течении для, доставка:"
        static let secondsInfoLabel = "Чт 25 фев - Бесплатно"
        static let threedInfoLabel = "Варианты доставки для местоположкния: 115533"
        static let boxSystemImage = "cube.box"
        static let checkDevice = "checklist"
        static let addToLike = "heart"
        static let shareButton = "square.and.arrow.up"
        static let addToBagTextButton = "Добавить в корзину"
    }
    
    private enum Url {
        static let blackCaseUrl = "https://re-store.ru/catalog/P057-106-13/"
        static let sportCaseUrl = "https://re-store.ru/catalog/MJ4V3ZM-A/"
        static let leatherCaseUrl = "https://re-store.ru/catalog/NM7MDT0M00/"
        static let airPodsCaseUrl = "https://re-store.ru/catalog/MLWK3/"
        static let defaulUrl = "https://re-store.ru"
    }
    
    // MARK: Public properties
    let nameOfItemLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20, y: 110, width: 400, height: 30))
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let priceOfItem: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 130, width: 200, height: 40))
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    let afterScrollViewLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 450, width: 300, height: 30))
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()
    
    var counter = Int()
    
    var product: Product?
    
    // MARK: Private properties
    private let compatibilityLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 600, width: 300, height: 30))
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = Constants.compatibilityTextLabel
        label.labelColorChange(for:
                                Constants.compatibilityTextLabel as NSString,
                               into: .systemBlue,
                               from: 13,
                               to: 21)
        return label
    }()
    
    private let firstTextLabel: UILabel = {
        var text = UILabel(frame: CGRect(
            x: 50, y: 730, width: 300, height: 30))
        text.text = Constants.firstInfoLabel
        text.textColor = .white
        text.font = .boldSystemFont(ofSize: 13)
        text.textAlignment = .left
        return text
    }()
    
    private let secondTextLabel: UILabel = {
        var text = UILabel(frame: CGRect(
            x: 50, y: 750, width: 300, height: 20))
        text.text = Constants.secondsInfoLabel
        text.font = .systemFont(ofSize: 13)
        text.textColor = .lightGray
        text.textAlignment = .left
        return text
    }()
    
    private let thirdTextLabel: UILabel = {
        var text = UILabel(frame: CGRect(
            x: 50, y: 768, width: 350, height: 20))
        text.text = Constants.threedInfoLabel
        text.font = .systemFont(ofSize: 13)
        text.textColor = .systemBlue
        text.textAlignment = .left
        return text
    }()
    
    private let boxImageView: UIImageView = {
        var image = UIImageView(frame: CGRect(
            x: 20, y: 740, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.boxSystemImage)
        return image
    }()
    
    private let checkStatus: UIImageView = {
        var image = UIImageView(frame: CGRect(
            x: 63, y: 606, width: 18, height: 18))
        image.image = UIImage(named: Constants.checkDevice)
        return image
    }()
    
    private let borderColorButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 0, y: 0, width: 48, height: 48))
        button.layer.cornerRadius = 24
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    private lazy var whiteButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 160, y: 500, width: 40, height: 40))
        button.layer.cornerRadius = button.bounds.width / 2
        button.backgroundColor = .gray
        button.tag = 0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 2.0
        button.layer.shadowRadius = 12
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.shadowOffset = CGSize(width: 1, height: 25)
        button.addTarget(self, action: #selector(switchColorBorderButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var darkGrayButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 215, y: 500, width: 40, height: 40))
        button.layer.cornerRadius = button.bounds.width / 2
        button.tag = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 2.0
        button.layer.shadowRadius = 12
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.shadowOffset = CGSize(width: 1, height: 25)
        button.backgroundColor = UIColor(red: 72.0/255, green: 68.0/255, blue: 71.0/255, alpha: 1.0)
        button.addTarget(self, action: #selector(switchColorBorderButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var addToBasketButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 0, y: 660, width: 400, height: 45))
        button.setTitle(Constants.addToBagTextButton, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    lazy var photoScroll: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(
            x: 0, y: 200, width: self.view.bounds.width, height: 200))
        scroll.contentSize = CGSize(
            width: Int(self.view.bounds.width) * (self.product?.imageNames.count ?? 0),
            height: 200)
        scroll.isPagingEnabled = true
        scroll.contentMode = .scaleAspectFit
        scroll.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnImageViewAction)))
        return scroll
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarColor(with: UIColor(red: 22.0 / 255, green: 18.0 / 255, blue: 22.0 / 255, alpha: 1.0))
    }
    
    // MARK: Private Methods
    private func setView() {
        setScrollViewElements()
        view.addSubview(nameOfItemLabel)
        view.backgroundColor = .black
        
        view.addSubview(priceOfItem)
        priceOfItem.center.x = view.center.x
        
        view.addSubview(whiteButton)
        view.addSubview(darkGrayButton)
        
        view.addSubview(compatibilityLabel)
        compatibilityLabel.center.x = view.center.x
        
        view.addSubview(afterScrollViewLabel)
        afterScrollViewLabel.center.x = view.center.x
        
        view.addSubview(addToBasketButton)
        addToBasketButton.center.x = view.center.x
        
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(thirdTextLabel)
        view.addSubview(boxImageView)
        view.addSubview(checkStatus)
        view.addSubview(photoScroll)
        addRightButtons()
    }
    
    private func setScrollViewElements() {
        nameOfItemLabel.text = product?.name
        afterScrollViewLabel.text = product?.name
        priceOfItem.text = product?.price
        
        guard let product = product else { return }
        for imageName in product.imageNames {
            addNewImageView(imageName: imageName)
            
        }
    }
    
    private func addNewImageView(imageName: String) {
        var imageViewRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 190)
        imageViewRect.origin.x = imageViewRect.size.width * CGFloat(photoScroll.subviews.count)
        let imageView = newImageViewWithImage(paramImage: imageName, paramFrame: imageViewRect)
        photoScroll.addSubview(imageView)
    }
    
    private func newImageViewWithImage(paramImage: String, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: paramImage)
        
        return result
    }
    
    private func setupNavigationBarColor(with color: UIColor) {
        navigationController?.navigationBar.prefersLargeTitles = false
        let navigationBarAppreance = UINavigationBarAppearance()
        navigationBarAppreance.configureWithOpaqueBackground()
        navigationBarAppreance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppreance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppreance.backgroundColor = color
        navigationController?.navigationBar.standardAppearance = navigationBarAppreance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppreance
    }
    
    private func addRightButtons() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: Constants.addToLike),
                            style: .done,
                            target: self,
                            action: nil),
            UIBarButtonItem(image: UIImage(systemName: Constants.shareButton),
                            style: .done,
                            target: self,
                            action: nil)]
    }
    
    // MARK: @Objc private Action
    @objc private func switchColorBorderButtonAction(sender: UIButton) {
        switch sender.tag {
        case 0:
            borderColorButton.center = whiteButton.center
            view.addSubview(borderColorButton)
        case 1:
            borderColorButton.center = darkGrayButton.center
            view.addSubview(borderColorButton)
        default:
            break
        }
    }
    
    @objc private func tapOnImageViewAction(sender: UITapGestureRecognizer) {
        let newVC = WebViewController()
        switch photoScroll.tag {
        case 0:
            newVC.url = Url.blackCaseUrl
        case 1:
            newVC.url = Url.sportCaseUrl
        case 2:
            newVC.url = Url.leatherCaseUrl
        case 3:
            newVC.url = Url.airPodsCaseUrl
        default:
            newVC.url = Url.defaulUrl
        }
        let navVC = UINavigationController(rootViewController: newVC)
        navVC.navigationController?.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

// MARK: Extension + UILabel
extension UILabel {
    func labelColorChange(for givenText: NSString,
                          into color: UIColor,
                          from locationNumber: Int,
                          to length: Int) {
        
        let myString: NSString = givenText
        var mutableString = NSMutableAttributedString()
        
        mutableString = NSMutableAttributedString(string: myString as String,
                                                  attributes: [NSAttributedString.Key.font:
                                                                UIFont(name: "Helvetica", size: 13.5) ?? ""])
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                   value: color,
                                   range: NSRange(location: locationNumber, length: length))
        self.attributedText = mutableString
    }
}
