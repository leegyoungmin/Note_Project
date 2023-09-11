//
//  TopTabBarController.swift
//  TopTabBarController
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

class TopTabBarController<T: TabItem>: UITabBarController {
    private let topTabBar = TopTabBar(items: Array(T.allCases))
    
    override func viewDidLoad() {
        configureTopTabBar()
        configureChildViewControllers(items: Array(T.allCases))
    }
    
    private func configureTopTabBar() {
        self.tabBar.isHidden = true
        topTabBar.delegate = self
        view.addSubview(topTabBar)
        
        NSLayoutConstraint.activate([
            topTabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topTabBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func configureChildViewControllers(items: [T]) {
        let controllers = items.map(\.viewController)
        setViewControllers(controllers, animated: true)
    }
}

extension TopTabBarController: TopTabBarDelegate {
    func topTabBar(bar: TopTabBar, didTapSelectedItem index: Int) {
        self.selectedIndex = index
    }
}
