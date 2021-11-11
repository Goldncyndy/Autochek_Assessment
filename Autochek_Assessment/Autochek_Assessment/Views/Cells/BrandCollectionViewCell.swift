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
    imageView.contentMode = .scaleToFill
      imageView.clipsToBounds = true
      imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius =  imageView.frame.size.height/2
      return imageView
  }()
  let brandName: UILabel = {
      let text = UILabel()
      text.font = UIFont(name: "NunitoSans-Bold", size: 25)
      text.translatesAutoresizingMaskIntoConstraints = false
      return text
  }()
  override init(frame: CGRect) {
      super.init(frame: frame)
      setUpViews()
  }
  func setUpViews() {
          addSubview(brandName)
          addSubview(productImageView)
    productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: brandName.bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 20, rightConstant: 0)
      brandName.anchorWithConstantsToTop(top: bottomAnchor, left: leftAnchor,
                                        bottom: bottomAnchor,
                                        right: rightAnchor,
                                        topConstant: 10,
                                        leftConstant: 20,
                                        bottomConstant: 0, rightConstant: 20)
          brandName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
      }
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
