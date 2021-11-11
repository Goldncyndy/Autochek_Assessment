//
//  ExploreCollectionViewCell.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
  static let identifier = "ExploreCollectionViewCell"
  
  var cards: [ExploreCards] = []
  
  let productImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
  }()
  let productNametextView: UITextView = {
      let textView = UITextView()
      textView.isEditable = false
      textView.font = UIFont(name: "NunitoSans-Bold", size: 18)
      textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 20)
      textView.translatesAutoresizingMaskIntoConstraints = false
      return textView
  }()
  let productBrandTextView: UITextView = {
      let textView = UITextView()
      textView.isEditable = false
      textView.font = UIFont(name: "NunitoSans-Regular", size: 14)
      textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 20)
      textView.translatesAutoresizingMaskIntoConstraints = false
      return textView
  }()
  let productRateView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
  }()
  let productPriceTextView: UITextView = {
      let textView = UITextView()
      textView.isEditable = false
      textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
      textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 20)
      textView.translatesAutoresizingMaskIntoConstraints = false
      return textView
  }()
  lazy var addButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Filter-Button"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override init(frame: CGRect) {
      super.init(frame: frame)
      setUpViews()
  }
  func setUpViews() {
          addSubview(productNametextView)
          addSubview(productImageView)
          addSubview(productBrandTextView)
          addSubview(productPriceTextView)
          addSubview(productRateView)
          addSubview(addButton)
    productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: productNametextView.topAnchor, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    productNametextView.anchorWithConstantsToTop(top: productImageView.bottomAnchor, left: leftAnchor,
                    bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 0,
                    bottomConstant: 40, rightConstant: 20)
   // productNametextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    productBrandTextView.anchorWithConstantsToTop(top: productNametextView.bottomAnchor, left: leftAnchor,
                    bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 0,
                    bottomConstant: 35, rightConstant: 20)
    productPriceTextView.anchorWithConstantsToTop(top: productBrandTextView.bottomAnchor, left: leftAnchor,
                    bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 0,
                    bottomConstant: 30, rightConstant: 20)
    productRateView.anchorWithConstantsToTop(top: productBrandTextView.bottomAnchor, left: leftAnchor,
                                             bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 0,
                                             bottomConstant: 30, rightConstant: 20)
    addButton.anchorWithConstantsToTop(top: productRateView.bottomAnchor, left: leftAnchor,
                    bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 20,
                    bottomConstant: 25, rightConstant: 0)
      }
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

extension UIView {
  func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
      anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
  }
  func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                bottom: NSLayoutYAxisAnchor? = nil,
                                right: NSLayoutXAxisAnchor? = nil,
                                topConstant: CGFloat = 0,
                                leftConstant: CGFloat = 0,
                                bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
      translatesAutoresizingMaskIntoConstraints = false
      if let top = top {
          topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
      }
      if let bottom = bottom {
          bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
      }
      if let left = left {
          leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
      }
      if let right = right {
          rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
      }
  }
}
