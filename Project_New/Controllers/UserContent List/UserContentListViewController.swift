//
//  UserContentListViewController.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class UserContentListViewController: BaseViewController {

    var tblVw =  UITableView()

    private let refreshControl = UIRefreshControl()

    var viewModel: UserContentViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialSettings()

    }

    // MARK: - Bind View Model

    private func bindViewModel() {
        viewModel?.showLoading.bindAndFire(listener: {
            if $0 {
                self.startActivityIndicator()
            } else {
                self.stopActivityIndicator()
            }
        })

        viewModel?.showError.bindAndFire(listener: {
            self.showInternetViewWithMsg(msg: $0)
        })

        viewModel?.contentList.bindAndFire(listener: {
            self.title = self.viewModel?.navTitle
            if !$0.isEmpty {
                self.tblVw.isHidden = false
                self.tblVw.reloadData()
            } else {
                self.tblVw.isHidden = true
            }
        })
    }

    // MARK: - Load Initial Settings

    private func loadInitialSettings() {
        loadTableView()
        addRefreshControl()
        viewModel?.fetchContent()

        bindViewModel()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .black

        // Play around with the duration until you find
        // a time interval, you find suitable
        UIView.animate(withDuration: 2) {
            self.navigationController?.navigationBar.isTranslucent = true
        }

    }

    // MARK: - Add Refresh control to table view

    private func addRefreshControl() {

        refreshControl.attributedTitle = NSAttributedString(string: Constants.refreshTitle)
        refreshControl.backgroundColor = UIColor.red
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)

        if #available(iOS 10.0, *) {
            tblVw.refreshControl = refreshControl
        } else {
            tblVw.addSubview(refreshControl)
        }
    }

    // MARK: - Refresh control method

    @objc func pullToRefresh() {
        refreshControl.endRefreshing()

        if isActivityIndicatorAnimating() {
            return
        }

        viewModel?.fetchContent()
    }

    // MARK: - Load Table view

    private func loadTableView() {

        self.view.addSubview(tblVw)
        tblVw.translatesAutoresizingMaskIntoConstraints = false
        tblVw.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tblVw.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tblVw.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tblVw.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true

        tblVw.delegate = self
        tblVw.dataSource = self
        tblVw.rowHeight = UITableView.automaticDimension
        tblVw.estimatedRowHeight = 100
        tblVw.register(UserContentListTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

        //view.addSubview(tblVw)
        tblVw.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - TableView DataSource And Delegate

extension UserContentListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.contentList.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? UserContentListTableViewCell else {
        fatalError(Constants.retryTitle)
             }
        cell.selectionStyle = .none
        if let cellViewModel = viewModel?.contentList.value[indexPath.row] {
            cellViewModel.cell = cell
        }

        return cell
    }
}

// MARK: - Base view controller protocol

extension UserContentListViewController: BaseViewProtocol {
    func clickOnRetry() {
        self.showInternetViewWithMsg(msg: "")
        viewModel?.fetchContent()
    }
}
