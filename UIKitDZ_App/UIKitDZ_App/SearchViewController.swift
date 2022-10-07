//
//  SearchViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 06.10.2022.
//

import UIKit
/// Экран с поиском товара
final class SearchViewController: UIViewController {
    
    // MARK: Private properties
    private var searchControll: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Приложение"
        return search
    }()
    
    private let recentlyViewedTextField: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 10,
            y: 240,
            width: 300,
            height: 30))
        label.text = "Недавно просмотренные"
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
        label.text = "Очистить"
        label.textColor = .systemBlue
        return label
    }()
    
    private let caseForLaptopView: UIView = {
        var view = UIView(frame: CGRect(
            x: 10,
            y: 300,
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
            y: 300,
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
            y: 300,
            width: 150,
            height: 180))
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.tag = 2
        view.clipsToBounds = true
        return view
    }()
    
    private let caseImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 20,
            y: 20,
            width: 110,
            height: 80))
        caseImage.image = Contants.caseImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let sportImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 20,
            y: 20,
            width: 110,
            height: 80))
        caseImage.image = Contants.sportImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let leatherImageView: UIImageView = {
        var caseImage = UIImageView(frame: CGRect(
            x: 20,
            y: 5,
            width: 120,
            height: 120))
        caseImage.image = Contants.leatherImage
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let textCaseLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 8,
            y: 105,
            width: 120,
            height: 80))
        label.text = "Чехол Incase Flat для MacBook Pro 16 дюймов"
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
        label.text = "Спортивный ремешок Black Unity"
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
        label.text = "Кожаный Чехол Incase Flat для MacBook Pro 16 дюймов"
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
        label.text = "Варианты запросов"
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
        label.text = "AirPods"
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
        imageView.image = Contants.magnifyingglassImage
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
        label.text = "AppleCare"
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
        imageView.image = Contants.magnifyingglassImage
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
        label.text = "Beats"
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
        imageView.image = Contants.magnifyingglassImage
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
        label.text = "Сравните модели iPhone"
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
        imageView.image = Contants.magnifyingglassImage
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setElementsOnView()
        setGesture()
    }
    
    // MARK: Private Methods
    private func setView() {
        title = "Поиск"
        view.backgroundColor = .black
    }
    
    private func setGesture() {
        caseForLaptopView.isUserInteractionEnabled = true
        sportItemView.isUserInteractionEnabled = true
        leatherCaseView.isUserInteractionEnabled = true
        
        caseForLaptopView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
        sportItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
        leatherCaseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap(_:))))
    }
    
    private func setElementsOnView() {
    
        searchControll.searchResultsUpdater = self
        navigationItem.searchController = searchControll
        definesPresentationContext = true
        
        view.addSubview(recentlyViewedTextField)
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
        
        view.addSubview(queryOptions)
        
        view.addSubview(airPodsLabel)
        view.addSubview(lupaAirPodsImage)
        
        view.addSubview(appleCareLabel)
        view.addSubview(lupaAppleCareImage)
        
        view.addSubview(beatsLabel)
        view.addSubview(lupaBeatsImage)
        
        view.addSubview(modelIphoneLabel)
        view.addSubview(lupaModelPhoneImage)
    }
    
    internal func updateSearchResults(for searchControll: UISearchController) {
        
    }
    
    // MARK: @Objc private action
    @objc private func imageTap(_ sender: UITapGestureRecognizer) {
        let infoVC = InformationItemViewController()
        switch sender.view?.tag {
        case 0:
            infoVC.nameOfItem.text = textCaseLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: "Image")
        case 1:
            infoVC.nameOfItem.text = textSportLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: "4")
        case 2:
            infoVC.nameOfItem.text = textLeatherLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: "2")
        default:
            break
        }
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

// MARK: Extension - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    enum Contants {
        static let magnifyingglassImage = UIImage(systemName: "magnifyingglass")
        static let caseImage = UIImage(named: "Image")
        static let sportImage = UIImage(named: "4")
        static let leatherImage = UIImage(named: "2")
    }
}
