//
//  RepositoriesViewController.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {

    private lazy var repositoriesTableView: UITableView = {
        let tableView = UITableView(forAutoLayout: ())
        return tableView
    }()
    
    private var viewModel: ViewModel? = RepositoriesViewModel() {
        didSet { self.update() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoriesTableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        repositoriesTableView.estimatedRowHeight = 80
        repositoriesTableView.rowHeight = UITableView.automaticDimension
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
        
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func setupConstraints() {
        setupRepositoriesTableViewConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(repositoriesTableView)
    }
    
    func configureViews() {
        
    }
}

extension RepositoriesViewController: ViewModelConfigurable {
    
    typealias ViewModel = RepositoriesViewModel
    
    func configureWithViewModel(_ model: RepositoriesViewModel) {
        self.viewModel = model
    }
    
    func update() {
        self.repositoriesTableView.reloadData()
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIdentifier) as? RepositoryTableViewCell else {
            return UITableViewCell(forAutoLayout: ())
        }
        
        guard let repository = viewModel?.repositories[indexPath.row] else {
            return cell
        }
        
        cell.titleLabel.text = repository.name
        cell.descriptionLabel.text = "bla bla"
        cell.authorView.nameLabel.text = repository.owner.login
        cell.badgeView.textLabel.text = String(repository.stars)
        
        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension RepositoriesViewController: RepositoriesViewModelDelegate {
    
    func didFetchRepositories() {
        update()
    }
    
    func didFailToFetchRepositories(with error: Error) {
        
    }
}

/* We could use PureLayout library to make working with contraints a lot easier and less verbose */
extension RepositoriesViewController {
    
    private func setupRepositoriesTableViewConstraints() {
        
        let leftConstraint = NSLayoutConstraint(
            item: repositoriesTableView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 0
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: repositoriesTableView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: repositoriesTableView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0
        )
        
        let topConstraint = NSLayoutConstraint(
            item: repositoriesTableView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 0
        )
        
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, bottomConstraint, topConstraint])
    }
    
}
