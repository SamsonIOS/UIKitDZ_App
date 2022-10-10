//
//  SearchViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 06.10.2022.
//

import UIKit

/// Экран с поиском товара
final class SearchViewController: UIViewController {
    
    // MARK: Constants
    enum Constants {
        static let magnifyingglassImage = UIImage(systemName: "magnifyingglass")
        static let forCaseLaptopText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let forSportClockText = "Спортивный ремешок Black Unity"
        static let forLeatherCaseText = "Кожаный Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let forAirPodsText = "Наушники Air Pods Pro v2.0"
        static let queryOptionsText = "Варианты запросов"
        static let queryAirPodsText = "AirPods"
        static let queryAppleCareText = "AppleCare"
        static let queryBeatsText = "Beats"
        static let queryIphoneModelText = "Сравните модели iPhone"
        static let caseImage = UIImage(named: "Image")
        static let sportImage = UIImage(named: "4")
        static let airPodsImage = UIImage(named: "airpodsImage")
        static let priceForCaseLaptop = "3 990.00 руб."
        static let priceForSportCase = "4 590.00 руб."
        static let priceForLeatherCase = "2 990.00 руб."
        static let priceForAirPods = "12 990.00 руб."
        static let forLaptopCaseImage = ["Image", "case2", "case3"]
        static let forSportClockImage = ["4", "clock2"]
        static let forLeatherCaseImage = ["2", "caseBrown2", "caseBrown3"]
        static let recentlyViewedLabelText = "Недавно просмотренные"
        static let clearlLabelText = "Очистить"
    }
    
    // MARK: Private properties
    private let recentlyViewedLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 10,
            y: 240,
            width: 300,
            height: 30))
        label.text = Constants.recentlyViewedLabelText
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let clearLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 300,
            y: 242,
            width: 170,
            height: 30))
        label.text = Constants.clearlLabelText
        label.textColor = .systemBlue
        return label
    }()
    
    private let caseForLaptopView: UIView = {
        var view = UIView(frame: CGRect(
            x: 10,
            y: 0,
            width: 150,
            height: 180))
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.tag = 0
        return view
    }()
    
    private let sportItemView: UIView = {
        var view = UIView(frame: CGRect(
            x: 170,
            y: 0,
            width: 150,
            height: 180))
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.tag = 1
        return view
    }()
    
    private let leatherCaseView: UIView = {
        var view = UIView(frame: CGRect(
            x: 330,
            y: 0,
            width: 150,
            height: 180))
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.tag = 2
        view.clipsToBounds = true
        return view
    }()
    
    private let airPodsView: UIView = {
        var view = UIView(frame: CGRect(
            x: 490,
            y: 0,
            width: 150,
            height: 180))
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.tag = 3
        view.clipsToBounds = true
        return view
    }()
    
    private let caseImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 20,
            y: 20,
            width: 110,
            height: 80))
        caseImage.image = Constants.caseImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let sportImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 20,
            y: 20,
            width: 110,
            height: 80))
        caseImage.image = Constants.sportImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let leatherImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 15,
            y: 5,
            width: 120,
            height: 120))
        caseImage.image = UIImage(named: Constants.forLeatherCaseImage[0])
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let airPodsImageView: UIImageView = { //
        var caseImage = UIImageView(frame: CGRect(
            x: 15,
            y: 5,
            width: 120,
            height: 120))
        caseImage.image = Constants.airPodsImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let textCaseLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 8,
            y: 105,
            width: 120,
            height: 80))
        label.text = Constants.forCaseLaptopText
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let textSportLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 8,
            y: 105,
            width: 120,
            height: 80))
        label.text = Constants.forSportClockText
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let textLeatherLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 8,
            y: 105,
            width: 120,
            height: 80))
        label.text = Constants.forLeatherCaseText
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let textAirPodsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 8,
            y: 105,
            width: 120,
            height: 80))
        label.text = Constants.forAirPodsText
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let queryOptions: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20,
            y: 530,
            width: 300,
            height: 30))
        label.text = Constants.queryOptionsText
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    private let airPodsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 50,
            y: 580,
            width: 150,
            height: 30))
        label.text = Constants.queryAirPodsText
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let lupaAirPodsImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 23,
            y: 585,
            width: 18,
            height: 18))
        imageView.image = Constants.magnifyingglassImage
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let appleCareLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 50,
            y: 630,
            width: 150,
            height: 30))
        label.text = Constants.queryAppleCareText
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let lupaAppleCareImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 23,
            y: 635,
            width: 18,
            height: 18))
        imageView.image = Constants.magnifyingglassImage
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let beatsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 50,
            y: 680,
            width: 150,
            height: 30))
        label.text = Constants.queryBeatsText
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let lupaBeatsImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 23,
            y: 685,
            width: 18,
            height: 18))
        imageView.image = Constants.magnifyingglassImage
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let modelIphoneLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 50,
            y: 730,
            width: 250,
            height: 30))
        label.text = Constants.queryIphoneModelText
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let lupaModelPhoneImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 23,
            y: 735,
            width: 18,
            height: 18))
        imageView.image = Constants.magnifyingglassImage
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var itemScrollView: UIScrollView = {
        var scroll = UIScrollView(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 190))
        scroll.contentSize = CGSize(width: 660, height: 120)
        scroll.addSubview(caseForLaptopView)
        scroll.addSubview(sportItemView)
        scroll.addSubview(leatherCaseView)
        scroll.addSubview(airPodsView)
        return scroll
    }()
    
    private var searchControll: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Приложение"
        return search
    }()
    
    // MARK: Life cycle didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setElementsOnView()
        setGesture()
    }
    
    // MARK: Life cycle willApear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarColor(with: UIColor.black)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Private Methods
    private func setView() {
        title = "Поиск"
        view.backgroundColor = .black
    }
    
    private func setupNavBarColor(with color: UIColor) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = color
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setGesture() {
        caseForLaptopView.isUserInteractionEnabled = true
        sportItemView.isUserInteractionEnabled = true
        leatherCaseView.isUserInteractionEnabled = true
        airPodsView.isUserInteractionEnabled = true
        
        caseForLaptopView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
        sportItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
        leatherCaseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
        airPodsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
    }
    
    private func setElementsOnView() {
        searchControll.searchResultsUpdater = self
        navigationItem.searchController = searchControll
        definesPresentationContext = true
        
        view.addSubview(recentlyViewedLabel)
        view.addSubview(clearLabel)
        
        view.addSubview(caseForLaptopView)
        caseForLaptopView.addSubview(caseImageView)
        caseForLaptopView.addSubview(textCaseLabel)
        
        view.addSubview(sportItemView)
        sportItemView.addSubview(sportImageView)
        sportItemView.addSubview(textSportLabel)
        
        view.addSubview(leatherCaseView)
        leatherCaseView.addSubview(leatherImageView)
        leatherCaseView.addSubview(textLeatherLabel)
        
        view.addSubview(airPodsView)
        airPodsView.addSubview(airPodsImageView)
        airPodsView.addSubview(textAirPodsLabel)
        
        view.addSubview(queryOptions)
        
        view.addSubview(airPodsLabel)
        view.addSubview(lupaAirPodsImage)
        
        view.addSubview(appleCareLabel)
        view.addSubview(lupaAppleCareImage)
        
        view.addSubview(beatsLabel)
        view.addSubview(lupaBeatsImage)
        
        view.addSubview(modelIphoneLabel)
        view.addSubview(lupaModelPhoneImage)
        view.addSubview(itemScrollView)
    }
    
    // MARK: @Objc private action
    @objc private func imageTap(_ sender: UITapGestureRecognizer) {
        let infoVC = InformationItemViewController()
        switch sender.view?.tag {
        case 0:
            infoVC.nameOfItemLabel.text = textCaseLabel.text
            infoVC.afterScrollViewLabel.text = textCaseLabel.text
            infoVC.firstItemImageView.image = UIImage(named: Constants.forLaptopCaseImage[0])
            infoVC.secondItemImageView.image = UIImage(named: Constants.forLaptopCaseImage[1])
            infoVC.threedItemImageView.image = UIImage(named: Constants.forLaptopCaseImage[2])
            infoVC.priceOfItem.text = Constants.priceForCaseLaptop
            infoVC.counter = Constants.forLaptopCaseImage.count
        case 1:
            infoVC.nameOfItemLabel.text = textSportLabel.text
            infoVC.afterScrollViewLabel.text = textSportLabel.text
            infoVC.nameOfItemLabel.text = textSportLabel.text
            infoVC.firstItemImageView.image = UIImage(named: Constants.forSportClockImage[0])
            infoVC.secondItemImageView.image = UIImage(named: Constants.forSportClockImage[1])
            infoVC.priceOfItem.text = Constants.priceForSportCase
            infoVC.counter = Constants.forSportClockImage.count
        case 2:
            infoVC.nameOfItemLabel.text = textLeatherLabel.text
            infoVC.firstItemImageView.image = UIImage(named: Constants.forLeatherCaseImage[0])
            infoVC.secondItemImageView.image = UIImage(named: Constants.forLeatherCaseImage[1])
            infoVC.threedItemImageView.image = UIImage(named: Constants.forLeatherCaseImage[2])
            infoVC.priceOfItem.text = Constants.priceForLeatherCase
            infoVC.counter = Constants.forLeatherCaseImage.count
        case 3:
            infoVC.nameOfItemLabel.text = textAirPodsLabel.text
            infoVC.priceOfItem.text = Constants.priceForAirPods
            infoVC.firstItemImageView.image = UIImage(named: "airpodsImage")
        default:
            break
        }
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

// MARK: Extension - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    internal func updateSearchResults(for searchControll: UISearchController) {
    }
}
