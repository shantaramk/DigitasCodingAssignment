//
//  CountryDetailViewController.swift
//  MobileAxxessCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

/**
This is a sample for understanding the minimal ViewModel functionality.
*/

class CountryDetailViewController: UIViewController {
    
    // MARK: - Internal Properties
    var countryInfo: CountryInfoModel?

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
        tableView.register(CountryDetailCell.self, forCellReuseIdentifier: "CountryDetailCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    var countryName: String? {
        guard let countryInfo = countryInfo else { return nil }
        return countryInfo.name
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
 
    }

}

// MARK: - Configure UI

extension CountryDetailViewController {
    
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
        
        navigationItem.title = self.countryName
    }
}

// MARK: - TableView Delegate

extension CountryDetailViewController: UITableViewDelegate {
    
}

extension CountryDetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryDetailCell", for: indexPath) as! CountryDetailCell
        
        cell.countryInfo = countryInfo
        
        cell.selectionStyle = .none
        
        return cell
    }
}
