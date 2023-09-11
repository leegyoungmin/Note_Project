//
//  TopTabBar.swift
//  TopTabBarController
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

protocol TopTabBarDelegate: AnyObject {
    func topTabBar(bar: TopTabBar, didTapSelectedItem index: Int)
}

class TopTabBar: UIStackView {
    private var tabButtons = [UIButton]()
    private(set) var selectedOffset: Int = .zero {
        willSet {
            delegate?.topTabBar(bar: self, didTapSelectedItem: newValue)
        }
    }
    private var items: [any TabItem] = []
    weak var delegate: TopTabBarDelegate?
    
    init(items: [any TabItem]) {
        self.items = items
        super.init(frame: .zero)
        
        setUpViews()
        selectItem(to: .zero)
        setUpDetail()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func selectItem(to index: Int) {
        tabButtons.enumerated()
            .forEach { $0.element.isSelected = ($0.offset == index) }
        self.selectedOffset = index
    }
}

// MARK: - Configure UI
private extension TopTabBar {
    func generateButton(item: any TabItem) -> UIButton {
        let button: UIButton = {
            let button = UIButton()
            button.setTitle(item.title, for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .selected)
            button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
            return button
        }()
        
        return button
    }
    
    func setUpViews() {
        tabButtons = items.map(generateButton)
        
        tabButtons.enumerated().forEach { [weak self] (index, button) in
            let action = UIAction { _ in
                self?.selectItem(to: index)
            }
            button.addAction(action, for: .touchUpInside)
        }
        
        tabButtons.forEach { addArrangedSubview($0) }
    }
    
    func setUpDetail() {
        translatesAutoresizingMaskIntoConstraints = false
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
        spacing = 16
        distribution = .fill
        axis = .horizontal
    }
}
