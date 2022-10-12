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
    private enum Constants {
        static let magnifyingglassImage = UIImage(systemName: "magnifyingglass")
        static let queryOptionsText = "Варианты запросов"
        static let queryAirPodsText = "AirPods"
        static let queryAppleCareText = "AppleCare"
        static let queryBeatsText = "Beats"
        static let queryIphoneModelText = "Сравните модели iPhone"
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
        var scroll = UIScrollView(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 210))
        scroll.contentSize = CGSize(width: 660, height: 120)
        return scroll
    }()
    
    private var searchControll: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Приложение"
        return search
    }()
    
    private var viewFrame = 13
    
    private var tag = 0
    
    private var product = [
        Product(
            name: "Чехол Incase Flat для MacBook Pro 16 дюймов",
            imageNames: ["Image", "case2", "case3"],
            price: "3 990.00 руб."),
        Product(
            name: "Спортивный ремешок Black Unity",
            imageNames: ["4", "clock2"],
            price: "4 590.00 руб."),
        Product(
            name: "Кожаный Чехол Incase Flat для MacBook Pro 16 дюймов",
            imageNames: ["2", "caseBrown2", "caseBrown3"],
            price: "2 990.00 руб."),
        Product(
            name: "Наушники Air Pods Pro v2.0",
            imageNames: ["airpodsImage"],
            price: "12 990.00 руб.")
    ]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setElementsOnView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarColor(with: UIColor.black)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Private Methods
    private func setView() {
        title = "Поиск"
        view.backgroundColor = .black
        addView()
    }
    
    private func addView() {
        for item in product {
            createProductView(image: item.imageNames.first ?? "", info: item.name, cost: item.price, tag: tag)
            print(tag)
            tag += 1
        }
    }
    
    private func createProductView(image: String, info: String, cost: String, tag: Int) {
            let productView = UIView()
            productView.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
            productView.frame = CGRect(x: viewFrame, y: 0, width: 150, height: 200)
            productView.layer.cornerRadius = 15
            
            let label = UILabel()
            label.text = info
            label.textColor = .white
            label.numberOfLines = 3
            label.font = .boldSystemFont(ofSize: 13)
            label.frame = CGRect(x: 13, y: 115, width: 130, height: 80)
            
            let productImageView = UIImageView()
            let productImage = UIImage(named: image)
            productImageView.contentMode = .scaleAspectFit
            productImageView.image = productImage
            productImageView.frame = CGRect(x: 23, y: 25, width: 100, height: 100)
            
            productView.addSubview(productImageView)
            productView.addSubview(label)
            productView.tag = tag
        productView.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(imageTap(sender: ))))
            viewFrame += 165
            itemScrollView.addSubview(productView)
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
    
    private func setElementsOnView() {
        searchControll.searchResultsUpdater = self
        navigationItem.searchController = searchControll
        definesPresentationContext = true
        
        view.addSubview(recentlyViewedLabel)
        view.addSubview(clearLabel)
        
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
    @objc private func imageTap(sender: UITapGestureRecognizer) {
        let infoVC = InformationItemViewController()
        guard let tag = sender.view?.tag else { return }
        infoVC.product = product[tag]
        infoVC.photoScroll.tag = tag
        print(product[tag].imageNames.count)
       // infoVC.photoScroll.tag =
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

// MARK: Extension - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    internal func updateSearchResults(for searchControll: UISearchController) {
    }
}
