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
        imageView.backgroundColor = UIColor.orange
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.text = "Author Name"
        return label
    }()
    
    func buildViewHierarchy() {
        
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
            multiplier: 1,
            constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: avatarImageView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
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
        
        NSLayoutConstraint.activate([leftConstraint, bottomConstraint, centerYConstraint, topConstraint])
        
    }
    
    private func setupNameLabelConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nameLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 16
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 8
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 8
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
        
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, bottomConstraint, topConstraint])
        
    }
    
}
