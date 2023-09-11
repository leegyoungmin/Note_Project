//
//  TabBar.swift
//  TopTabBarController
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

protocol TabItem: CaseIterable {
    var title: String { get }
    var viewController: UIViewController { get }
}

enum MainTabItem: TabItem {
    case home
    case chat
    case setting
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .chat:
            return "채팅"
        case .setting:
            return "설정"
        }
    }
    var viewController: UIViewController {
        return LabelViewController(title: self.title)
    }
}
