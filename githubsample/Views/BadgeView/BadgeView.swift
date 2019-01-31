//
//  BadgeView.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class BadgeView: UIView {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(forAutoLayout: ())
        imageView.image = UIImage(named: "StarIcon")
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.text = "0000"
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubview(iconImageView)
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        setupTextLabelConstraints()
        setupIconImageViewConstraints()
    }
    
}

extension BadgeView {
    
    private func setupIconImageViewConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 8
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 0.5,
            constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 0.5,
            constant: 8
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 20
        )
        
        let widthtConstraint = NSLayoutConstraint(
            item: iconImageView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 20
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            bottomConstraint,
            topConstraint,
            centerYConstraint,
            heightConstraint,
            widthtConstraint
        ])
        
    }
    
    private func setupTextLabelConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: textLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: iconImageView,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 8
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: textLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: -16
        )

        let bottomConstraint = NSLayoutConstraint(
            item: textLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: -8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: textLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 8
        )
        
        let widthtConstraint = NSLayoutConstraint(
            item: textLabel,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 20
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            rightConstraint,
            bottomConstraint,
            topConstraint,
            widthtConstraint
        ])
        
    }
    
}
