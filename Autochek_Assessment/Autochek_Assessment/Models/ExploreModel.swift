//
//  EploreModel.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import Foundation

class ExploreCards {
  let productName: String
  let productBrand: String
  let productRating: String
  let price: String
  let imageName: String

  init(productName: String, productBrand: String, productRating: String, price: String, imageName: String){
        self.productName = productName
        self.productBrand = productBrand
        self.productRating = productRating
        self.price = price
        self.imageName = imageName
    }
}
