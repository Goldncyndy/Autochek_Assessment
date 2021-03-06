//
//  ExploreViewController.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit
import SVGKit

class ExploreViewController: UIViewController{
  var data = DataLoader()
  var cards: [ExploreCards] = []
  let dataLoader = DataLoader()
  var cars: Json4Swift_Base?
  var list: Welcome?
  // MARK: - TIME LABEL TO DISPLAY THE PAGE TITLE
  lazy var titlePageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Explore"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - EXPLORE IMAGE ICON
  lazy var exploreIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Explore-Image-Icon")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - CART BUTTON ICON FOR NOTIFICATION
  lazy var cartIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Cart-Icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  //MARK: // SEARCH BAR CONTROLLER
  let searchBar: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    textField.layer.borderWidth = 0
    textField.placeholder = "☌ Search"
    textField.isSecureTextEntry = true
    textField.autocapitalizationType = .none
    textField.layer.cornerRadius = 10
    return textField
  }()
  // MARK: - FILTER BUTTON SEARCHBAR
  lazy var searchButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Filter-Button"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - COLLECTION VIEW
  lazy var brandCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 25
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  .white
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  // MARK: - COLLECTION VIEW
  lazy var productCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 30
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  let cellId = "cellId"
  let productId = "productId"
  override func viewDidLoad() {
    super.viewDidLoad()
    data.pullJSONData { [weak self] data in
      guard self != nil else { return }
      print(data)
    }
    navigationController?.navigationBar.isHidden = true
    view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    productCollectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: "productId")
    brandCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    setupConstraints()
  }
  // MARK: - SETUP VIEWS FUNCTION
  func addDefaultViews() {
    view.addSubview(titlePageLabel)
    view.addSubview(exploreIcon)
    view.addSubview(cartIcon)
    view.addSubview(searchButton)
    view.addSubview(productCollectionView)
    view.addSubview(brandCollectionView)
    view.addSubview(searchBar)
  }
  // MARK: - FUNCTION TO SETUP VIEW CONSTRAINTS
  func setupConstraints() {
    addDefaultViews()
    NSLayoutConstraint.activate([
      //MARK: - CONSTRAINTS FOR EXPLORE ICON
      exploreIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      exploreIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      exploreIcon.heightAnchor.constraint(equalToConstant: 25),
      exploreIcon.widthAnchor.constraint(equalToConstant: 25),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      titlePageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      titlePageLabel.leadingAnchor.constraint(equalTo: exploreIcon.trailingAnchor, constant: 20),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cartIcon.heightAnchor.constraint(equalToConstant: 30),
      cartIcon.widthAnchor.constraint(equalToConstant: 30),
      //MARK: - CONSTRAINTS FOR SEARCH BAR
      searchBar.topAnchor.constraint(equalTo: cartIcon.bottomAnchor, constant: 20),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
      searchBar.heightAnchor.constraint(equalToConstant: 50),
      searchBar.widthAnchor.constraint(equalToConstant: 50),
      //MARK: - BRANDCOLLECTIONVIEW CONSTRAINTS
      //MARK: - CONSTRAINTS FOR SEARCH BUTTON
      searchButton.topAnchor.constraint(equalTo: cartIcon.bottomAnchor, constant: 20),
      searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      searchButton.heightAnchor.constraint(equalToConstant: 50),
      searchButton.widthAnchor.constraint(equalToConstant: 50),
    ])
    brandCollectionView.anchorWithConstantsToTop(top: searchBar.bottomAnchor,
                                                 left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 580, rightConstant: 0)
    
    productCollectionView.anchorWithConstantsToTop(top: brandCollectionView.bottomAnchor,
                                                   left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 20, rightConstant: 20)
  }
}

