//
//  VC+.swift
//  Kontax Cam
//
//  Created by Kevin Laminto on 22/5/20.
//  Copyright © 2020 Kevin Laminto. All rights reserved.
//

import Foundation
import UIKit

/// EXTENSIONS
// MARK: - UIApplication
extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

// MARK: - UIViewController
extension UIViewController {
    func configureView() {
        self.view.backgroundColor = UIColor.systemBackground
    }
    
    func configureNavigationBar(largeTitleColor: UIColor? = nil, backgoundColor: UIColor? = nil, tintColor: UIColor? = nil, title: String? = "", preferredLargeTitle: Bool? = nil) {
        
        let largeTitleColour = largeTitleColor == nil ? UIColor.label : largeTitleColor
        let backgroundColour = backgoundColor == nil ? UIColor.systemBackground : backgoundColor
        let tintColour = tintColor == nil ? UIColor.systemBlue : tintColor
        let prefLargeTitle = preferredLargeTitle == nil ? true : false
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColour!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColour!]
        navBarAppearance.backgroundColor = backgroundColour
        navBarAppearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController?.navigationBar.prefersLargeTitles = prefLargeTitle
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = tintColour
        navigationItem.title = title
    }
}


// MARK: - UIStackView
extension UIStackView {
    func addBackground(color: UIColor, cornerRadius: CGFloat? = 0) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.layer.cornerRadius = cornerRadius!
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
    
    func addArrangedSubview(_ v: UIView, withMargin m: UIEdgeInsets ) {
        let containerForMargin = UIView()
        containerForMargin.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: containerForMargin.topAnchor, constant: m.top ),
            v.bottomAnchor.constraint(equalTo: containerForMargin.bottomAnchor, constant: m.bottom ),
            v.leftAnchor.constraint(equalTo: containerForMargin.leftAnchor, constant: m.left),
            v.rightAnchor.constraint(equalTo: containerForMargin.rightAnchor, constant: m.right)
        ])
        
        addArrangedSubview(containerForMargin)
    }
}

// MARK: - UIFont
extension UIFont {
    func makeRoundedFont(ofSize style: UIFont.TextStyle, multiplier: CGFloat = 1, weight: UIFont.Weight) -> UIFont {
        let fontSize = UIFont.preferredFont(forTextStyle: style).pointSize * multiplier
        if let descriptor = UIFont.systemFont(ofSize: fontSize, weight: weight).fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: fontSize)
        } else {
            return UIFont.preferredFont(forTextStyle: style)
        }
    }
}

// MARK: - NotificationCenter
extension Notification.Name {
    static let filterList = Notification.Name("filterList")
}
