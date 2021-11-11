//
//  Extension+ExploreViewController.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == brandCollectionView {
      return items.count
    }
    if collectionView == productCollectionView {
      return cards.count
    }
    return 5
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == brandCollectionView {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as? BrandCollectionViewCell else { return UICollectionViewCell() }
      //cell.productImageView.text = UIImage(data: data!)
      cell.textView.text = items[indexPath.row].productBrand
      return cell
    }
    
    if collectionView == productCollectionView {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.identifier, for: indexPath) as? ExploreCollectionViewCell else { return UICollectionViewCell() }
      //cell.imageView.name = cards[indexPath.row].imageName
      cell.productNametextView.text = cards[indexPath.row].productName
      cell.productBrandTextView.text = cards[indexPath.row].productBrand
      cell.productPriceTextView.text = cards[indexPath.row].price
//      cell.productImageView.image = UIImage(data: data!)
//      cell.productImageView.image = UIImage(data: data!)
      return cell
    }
    return UICollectionViewCell()
  }
  class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }
  }

