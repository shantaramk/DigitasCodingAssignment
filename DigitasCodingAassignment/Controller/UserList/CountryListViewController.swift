//
//  CountryListViewController.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

protocol CountryListViewControllerProtocol {
    var viewModel: CountryViewModel { get set }
    func configureUI()
}

/**
This is a sample for understanding the minimal ViewModel functionality.
*/

class CountryListViewController: UIViewController, CountryListViewControllerProtocol {
    
    // MARK: - Internal Properties

    var viewModel = CountryViewModel()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0.0001
        tableView.sectionHeaderHeight = 0.0001
        tableView.separatorStyle = .singleLine
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor  = .gray
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
        
        viewModel.userList { error, _ in
            
            self.tableView.reloadData()
            
        }
    }

}

// MARK: - Configure UI

extension CountryListViewController {
    
    func configureUI() {
        
        configureView()
        
        configureNavigationBar()

        configureTableView()
        
    }
    
    func configureView() {
        
        self.view.backgroundColor = .white
    }
    
    func configureTableView() {
        
        self.view.addSubview(tableView)

        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
                    
        tableView.reloadData()
    }
    
    func configureNavigationBar() {
        
        navigationItem.title = LocalizedStringConstants.users
        
        //self.addRightNavigationBarButtonWithImage(UIImage(named:"sort")!)
        
    }

}

// MARK: - TableView Delegate

extension CountryListViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let countryInfo = self.viewModel.userList[indexPath.row]
        let object = CountryDetailViewController()
        object.countryInfo = countryInfo
        self.navigationController!.pushViewController(object, animated: true)
    }

}

extension CountryListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        cell.countryInfo = self.viewModel.userList[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - WebServices

