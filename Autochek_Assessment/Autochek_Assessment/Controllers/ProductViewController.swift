//
//  ProductViewController.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class ProductViewController: UIViewController {
  
  // MARK: - TIME LABEL TO DISPLAY THE PAGE TITLE
  lazy var titlePageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Product"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - EXPLORE IMAGE ICON
  lazy var exploreIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "back")
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

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    setupConstraints()
  }

  // MARK: - SETUP VIEWS FUNCTION
  func addDefaultViews() {
    view.addSubview(titlePageLabel)
    view.addSubview(exploreIcon)
    view.addSubview(cartIcon)
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
      titlePageLabel.leadingAnchor.constraint(equalTo: exploreIcon.trailingAnchor, constant: 40),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cartIcon.heightAnchor.constraint(equalToConstant: 30),
      cartIcon.widthAnchor.constraint(equalToConstant: 30),
    ])
  }
}

