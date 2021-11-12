//
//  TabBarController.swift
//  Autochek_Assessment
//
//  Created by Decagon on 12/11/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Create instance of viewControllers
      navigationController?.isNavigationBarHidden = true
        let homeViewController = ExploreViewController()
        let favoriteViewController = FavoriteViewController()
        let notificationViewController = NotificationViewController()
        let chatViewController = ChatViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([homeViewController, favoriteViewController, notificationViewController, chatViewController], animated: false)
      guard let items = self.tabBar.items else { return }
      let images = ["house.fill", "magnifyingglass", "bell.fill", "message.fill"]
      for item in 0...3 {
        items[item].image = UIImage(systemName: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .gray
    }
}
