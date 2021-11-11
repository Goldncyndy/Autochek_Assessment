//
//  BrandCollectionViewCell.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
  static let identifier = "BrandCollectionViewCell"
  
  var items: [ExploreBrand] = []
  
  let productImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
  }()
  let textView: UITextView = {
      let textView = UITextView()
      textView.isEditable = false
      textView.font = UIFont(name: "NunitoSans-Bold", size: 25)
      textView.contentInset = UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0)
      textView.translatesAutoresizingMaskIntoConstraints = false
      return textView
  }()
  override init(frame: CGRect) {
      super.init(frame: frame)
      setUpViews()
  }
  func setUpViews() {
          addSubview(textView)
          addSubview(productImageView)
      productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor, topConstant: 140, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
      textView.anchorWithConstantsToTop(top: productImageView.bottomAnchor, left: leftAnchor,
                                        bottom: bottomAnchor,
                                        right: rightAnchor,
                                        topConstant: 0,
                                        leftConstant: 20,
                                        bottomConstant: 20, rightConstant: 20)
          textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
      }
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
