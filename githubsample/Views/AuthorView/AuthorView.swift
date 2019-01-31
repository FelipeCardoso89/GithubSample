//
//  AuthorView.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class AuthorView: UIView {

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(forAutoLayout: ())
        imageView.image = UIImage(named: "ProfileIcon")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = (avatarImageView.frame.size.width / 2.0)
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        setupAvatarImageViewConstraints()
        setupNameLabelConstraints()
    }

}

extension AuthorView {
    
    private func setupAvatarImageViewConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 8
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 0.5,
            constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 0.5,
            constant: 8
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 28
        )
        
        let widthtConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 28
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            bottomConstraint,
            centerYConstraint,
            topConstraint,
            widthtConstraint,
            heightConstraint
        ])
        
    }
    
    private func setupNameLabelConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 16
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: -8
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: -8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 8
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            rightConstraint,
            bottomConstraint,
            topConstraint
        ])
    }
    
}
