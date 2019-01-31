//
//  RepositoryTableViewCell.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorView: AuthorView = {
        let view = AuthorView(forAutoLayout: ())
        return view
    }()
    
    lazy var badgeView: BadgeView = {
        let view = BadgeView(forAutoLayout: ())
        return view
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(authorView)
        contentView.addSubview(badgeView)
    }
    
    func setupConstraints() {
        setupTitleLabelConstriants()
        setupDescriptionLabelConstriants()
        setupBadgeViewConstriants()
        setupAuthorViewConstriants()
    }
}

extension RepositoryTableViewCell {
    
    private func setupTitleLabelConstriants() {
        
        let leftConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 18
        )
        
        let topConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 8
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: -8
        )
        
        NSLayoutConstraint.activate([leftConstraint, bottomConstraint, topConstraint])
        
    }
    
    private func setupDescriptionLabelConstriants() {
        
        let leftConstraint = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 18
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: titleLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: authorView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: -8
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 32
        )
        
        NSLayoutConstraint.activate([
            heightConstraint,
            leftConstraint,
            rightConstraint,
            bottomConstraint
        ])
    }
    
    private func setupBadgeViewConstriants() {
        
        let leftConstraint = NSLayoutConstraint(
            item: badgeView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: titleLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 16
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: badgeView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: -16
        )
        
        let topConstraint = NSLayoutConstraint(
            item: badgeView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 8
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: badgeView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 120
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            rightConstraint,
            widthConstraint,
            topConstraint
        ])
        
    }
    
    private func setupAuthorViewConstriants() {
        
        let leftConstraint = NSLayoutConstraint(
            item: authorView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 0
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: authorView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: descriptionLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: authorView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: -8
        )
        
        NSLayoutConstraint.activate([
            leftConstraint,
            rightConstraint,
            bottomConstraint
        ])
    }
    
}


