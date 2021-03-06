//
//  MenuView.swift
//  ColorMatchTabs
//
//  Created by Serhii Butenko on 27/6/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

@objc open class MenuView: UIView {
    
    public var navigationBar: UIView!
    private(set) var tabs: ColorTabs!
    public var scrollMenu: ScrollMenu!
    private(set) var circleMenuButton: UIButton!
    
    private var shadowView: VerticalGradientView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        layoutIfNeeded()
    }
    
    func setCircleMenuButtonHidden(_ hidden: Bool) {
        circleMenuButton.isHidden = hidden
        shadowView.isHidden = hidden
    }
    
}

// Init
private extension MenuView {
    
    func commonInit() {
        backgroundColor = .white
        createSubviews()
        
        layoutNavigationBar()
        layoutTabs()
        layoutScrollMenu()
        layoutShadowView()
        layoutCircleMenu()
    }
    
    func createSubviews() {
        scrollMenu = ScrollMenu()
        scrollMenu.showsHorizontalScrollIndicator = false
        addSubview(scrollMenu)
        
        navigationBar = ExtendedNavigationBar()
        navigationBar.backgroundColor = .white
        addSubview(navigationBar)
        
        tabs = ColorTabs()
        tabs.isUserInteractionEnabled = true
        navigationBar.addSubview(tabs)
        
        shadowView = VerticalGradientView()
        shadowView.isHidden = true
        shadowView.topColor = UIColor(white: 1, alpha: 0)
        shadowView.bottomColor = UIColor(white: 1, alpha: 1)
        addSubview(shadowView)
        
        circleMenuButton = UIButton()
        circleMenuButton.isHidden = true
        circleMenuButton.setImage(UIImage(namedInCurrentBundle: "circle_menu"), for: UIControl.State())
        circleMenuButton.adjustsImageWhenHighlighted = false
        addSubview(circleMenuButton)
    }
    
}

// Layout
public extension MenuView {
    
    func layoutNavigationBar() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func layoutTabs() {
        tabs.translatesAutoresizingMaskIntoConstraints = false
        tabs.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor).isActive = true
        tabs.topAnchor.constraint(equalTo: navigationBar.topAnchor).isActive = true
        tabs.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor).isActive = true
        tabs.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -6).isActive = true
    }
    
    @objc dynamic func layoutScrollMenu() {
        scrollMenu.translatesAutoresizingMaskIntoConstraints = false
        scrollMenu.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollMenu.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        scrollMenu.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollMenu.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func layoutShadowView() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func layoutCircleMenu() {
        circleMenuButton.translatesAutoresizingMaskIntoConstraints = false
        circleMenuButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: PlusButtonButtonOffset).isActive = true
        circleMenuButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
