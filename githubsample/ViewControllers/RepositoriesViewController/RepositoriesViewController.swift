//
//  RepositoriesViewController.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {

    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl(forAutoLayout: ())
        control.addTarget(self, action: #selector(fetchRepositories), for: .valueChanged)
        return control
    }()

    private lazy var repositoriesTableView: UITableView = {
        
        let tableView = UITableView(forAutoLayout: ())
        tableView.refreshControl = refreshControl
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.accessibilityIdentifier = "repositories_table_view"
        return tableView
    }()
    
    private var viewModel: ViewModel? {
        didSet { self.update() }
    }
    
    convenience init(viewModel: RepositoriesViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories"
        
        viewModel?.delegate = self
        
        setupRepositoriesTableView()
        
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshControl.beginRefreshingManually()
    }
    
    func setupConstraints() {
        setupRepositoriesTableViewConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(repositoriesTableView)
    }
    
    func configureViews() {
        
    }
    
    @objc func fetchRepositories() {
        viewModel?.fethFirstPage()
    }
    
    @objc func loadNextPage() {
        viewModel?.fetchNextPage()
    }
}

extension RepositoriesViewController: ViewModelConfigurable {
    
    typealias ViewModel = RepositoriesViewModel
    
    func configureWithViewModel(_ model: RepositoriesViewModel) {
        self.viewModel = model
    }
    
    func update() {
        DispatchQueue.main.async {
            self.repositoriesTableView.refreshControl?.endRefreshing()
            self.repositoriesTableView.reloadData()
        }
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIdentifier) as? RepositoryTableViewCell else {
            return UITableViewCell(forAutoLayout: ())
        }
        
        guard let repositories = viewModel?.repositories else {
            return cell
        }
        
        let repository = repositories[indexPath.row]
        cell.titleLabel.text = repository.name
        cell.descriptionLabel.text = repository.description
        cell.authorView.nameLabel.text = repository.owner.login
        cell.badgeView.textLabel.text = String(repository.stars)
        
        if let url = repository.owner.avatar {
            cell.authorView.avatarImageView.loadImage(
                from: url,
                placeholder: UIImage(named: "ProfileIcon")
            )
        }
        
        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension RepositoriesViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let viewModel = self.viewModel else {
            return
        }
        
        guard didPushBeyondLimitToLoadNextPage(for: scrollView), viewModel.canLoadNextPage else {
            return
        }
        
        viewModel.fetchNextPage()
    }
    
    private func didPushBeyondLimitToLoadNextPage(for scrollView: UIScrollView) -> Bool {
        
         let contentOffsetY: CGFloat = (
            scrollView.contentSize.height -
            (scrollView.frame.size.height + scrollView.contentOffset.y)
        )
        
        return (contentOffsetY < 300)
    }
    

}

extension RepositoriesViewController: RepositoriesViewModelDelegate {
    
    func didFetchRepositories() {
        update()
    }
    
    func didFailToFetchRepositories(with error: Error) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(
                title: "Algo deu errado!",
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            //I could send it to de coordinator to present a custom error screen.
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

/* We could use PureLayout library to make working with contraints a lot easier and less verbose */
extension RepositoriesViewController {
    
    private func setupRepositoriesTableView() {
        repositoriesTableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
    }
    
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
            attribute: NSLayoutConstraint.Attribute.bottomMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.bottomMargin,
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
        
        NSLayoutConstraint.activate([
            leftConstraint,
            rightConstraint,
            bottomConstraint,
            topConstraint
        ])
    }
    
}
