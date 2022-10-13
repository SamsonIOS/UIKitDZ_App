//
//  ForUsViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 06.10.2022.
//

import UIKit

/// Экран с рекомендациями для пользователя
final class ForUsViewController: UIViewController {
    
    // MARK: Visual Components
    private enum Constants {
        static let newText = "Вот что нового"
        static let air = "airpodsImage"
        static let sentOrderText = "Ваш заказ отправлен"
        static let infoOrder = "1 товар, доставка завтра"
        static let processed = "Обрабатывается"
        static let sent = "Отправленно"
        static let delivered = "Доставленно"
        static let recommended = "Рекомендуется вам"
        static let appBage = "app.badge"
        static let getNews = "Получайте новости о своем заказе режиме реального времени."
        static let getNotifications = "Включите уведомления, чтобы получать новости о своем заказе"
        static let devices = "ваши устройства"
        static let showAll = "Показать все"
        static let userDefaultsImageName = "avatar"
        static let forUsText = "checklist"
        static let title = "Для вас"
        static let imageSizeForLargeState: CGFloat = 40
        static let imageRightMargin: CGFloat = 16
        static let imageBottomMarginForLargeState: CGFloat = 12
        static let imageBottomMarginForSmallState: CGFloat = 6
        static let imageSizeForSmallState: CGFloat = 32
        static let navigationBarHeightSmallState: CGFloat = 44
        static let navigationBarHeightLargeState: CGFloat = 96.5
    }
    
    // MARK: Public properties
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.forUsText)
        image.layer.cornerRadius = Constants.imageSizeForLargeState / 2
        image.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconImageViewAction))
        image.addGestureRecognizer(tapGestureRecognizer)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    // MARK: Private Properties
    private let newLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20, y: 20, width: 250, height: 50))
        label.text = Constants.newText
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let airPodsImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(
            x: 15, y: 10, width: 80, height: 80))
        image.image = UIImage(named: Constants.air)
        return image
    }()
    
    private let orderSentLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 100, y: 30, width: 200, height: 20))
        label.text = Constants.sentOrderText
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let infoOderLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 100, y: 55, width: 200, height: 20))
        label.text = Constants.infoOrder
        label.textColor = .tertiaryLabel
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0, y: 90, width: self.view.bounds.width - 40, height: 170))
        view.center.x = self.view.center.x
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2.5, height: 1.5)
        view.layer.shadowRadius = 10.0
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        
        let processed = UILabel()
        processed.text = Constants.processed
        processed.textColor = .black
        processed.font = .boldSystemFont(ofSize: 13)
        processed.frame = CGRect(x: 10, y: 130, width: 120, height: 20)
        
        let sent = UILabel()
        sent.text = Constants.sent
        sent.textColor = .black
        sent.textAlignment = .center
        sent.font = .boldSystemFont(ofSize: 13)
        sent.frame = CGRect(x: 140, y: 130, width: 110, height: 20)
        
        let deliver = UILabel()
        deliver.text = Constants.delivered
        deliver.textColor = .systemGray
        deliver.font = .boldSystemFont(ofSize: 13)
        deliver.frame = CGRect(x: 250, y: 130, width: 110, height: 20)
        deliver.textAlignment = .right
        
        view.addSubview(processed)
        view.addSubview(sent)
        view.addSubview(deliver)
        return view
    }()
    
    private let recommendedLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20, y: 310, width: 350, height: 50))
        label.text = Constants.recommended
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let appBageImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(
            x: 23, y: 380, width: 35, height: 35))
        image.image = UIImage(systemName: Constants.appBage)
        image.tintColor = .red
        return image
    }()
    
    private let getNewsLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 80, y: 360, width: 260, height: 100))
        label.text = Constants.getNews
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let getNotificationsLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 80, y: 410, width: 330, height: 100))
        label.text = Constants.getNotifications
        label.textColor = .tertiaryLabel
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20, y: 560, width: 300, height: 50))
        label.text = Constants.devices
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(
            x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        scroll.backgroundColor = .white
        scroll.contentSize = CGSize(width: self.view.bounds.width, height: 1000)
        return scroll
    }()
    
    private lazy var showAllLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20, y: 575, width: view.bounds.width - 40, height: 30))
        label.text = Constants.showAll
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var infoProgressView: UIProgressView = {
        let progress = UIProgressView(frame: CGRect(
            x: 10, y: 120, width: infoView.bounds.width - 20, height: 50))
        progress.progressTintColor = .systemGreen
        progress.transform = progress.transform.scaledBy(x: 1, y: 2)
        progress.trackTintColor = .tertiaryLabel
        progress.layer.cornerRadius = 3
        progress.clipsToBounds = true
        progress.setProgress(0.5, animated: true)
        return progress
    }()
    
    private lazy var separateView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0, y: 105, width: self.view.bounds.width - 40, height: 1))
        view.backgroundColor = .tertiaryLabel
        return view
    }()
    
    private lazy var createSeparator = makeSeparatorView(yCoordinate: 0)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: Public Methods
    func saveUserDefaults(image: Data) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(image, forKey: Constants.userDefaultsImageName)
    }
    
    // MARK: @Objc private action
    @objc private func iconImageViewAction() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    // MARK: Private Methods
    private func setView() {
        view.backgroundColor = .white
        title = Constants.title
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "", style: .done, target: self, action: nil)
        
        addElementsOnView()
        setupUI()
        setupUI()
        loadFromUserDefaults()
    }
    
    private func loadFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        guard
            let data = userDefaults.object(forKey: Constants.userDefaultsImageName) as? Data,
            let image = UIImage(data: data)
        else { return }
        iconImageView.image = image
    }
    
    private func setupUI() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                 constant: -Constants.imageRightMargin),
            iconImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                  constant: -Constants.imageBottomMarginForLargeState),
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.imageSizeForLargeState),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Constants.navigationBarHeightSmallState
            
            let heightDifferenceBetweenStates =
            (Constants.navigationBarHeightLargeState - Constants.navigationBarHeightSmallState)
            
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Constants.imageSizeForSmallState / Constants.imageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        let sizeDiff = Constants.imageSizeForLargeState * (1.0 - factor)
        
        let yTranslation: CGFloat = {
            let maxYTranslation =
            Constants.imageBottomMarginForLargeState - Constants.imageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation,
                              (maxYTranslation - coeff * (Constants.imageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        iconImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    private func addElementsOnView() {
        view.addSubview(scrollView)
        scrollView.addSubview(newLabel)
        scrollView.addSubview(infoView)
        infoView.addSubview(airPodsImageView)
        infoView.addSubview(separateView)
        infoView.addSubview(orderSentLabel)
        infoView.addSubview(infoOderLabel)
        infoView.addSubview(infoProgressView)
        scrollView.addSubview(devicesLabel)
        scrollView.addSubview(getNewsLabel)
        scrollView.addSubview(getNotificationsLabel)
        scrollView.addSubview(showAllLabel)
        scrollView.addSubview(recommendedLabel)
        scrollView.addSubview(appBageImageView)
        makeRequestOptions(yCoordinateConstant: 520)
    }
}

// MARK: Extension + ForUsViewController
private extension ForUsViewController {
    
    func makeSeparatorView(yCoordinate: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        view.frame = CGRect(x: 20, y: yCoordinate, width: 370, height: 1)
        return view
    }
    
    func makeRequestOptions(yCoordinateConstant: Int) {
        var yCoordinateSeparatorView = 0
        for _ in 1...2 {
            let separatorView = makeSeparatorView(yCoordinate: yCoordinateSeparatorView)
            yCoordinateSeparatorView += yCoordinateConstant
            scrollView.addSubview(separatorView)
        }
    }
}

// MARK: Extension + UIImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
