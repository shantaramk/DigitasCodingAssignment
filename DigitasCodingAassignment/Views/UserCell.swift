//
//  UserCell.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Internal Properties
    
    var countryInfo: CountryInfoModel? {
        didSet {
            self.updateUI()
        }
    }
    
    fileprivate let nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    fileprivate let capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    fileprivate let populationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    fileprivate let currenciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let nameTitleLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        
        return label
    }()
    
    fileprivate let capitalTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    
    fileprivate let populationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    fileprivate let currenciesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateUI() {
        // modify any view
        guard let countryInfo = countryInfo else { return }
        nameLabel.text = countryInfo.name
        capitalLabel.text = countryInfo.capital
        let population = countryInfo.population ?? 0
        populationLabel.text = "\(String(describing: population))"
        currenciesLabel.text = countryInfo.currencies?[0] ?? ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI

extension UserCell {
    
    func configureUI() {
        
        configureView()
    }
    
    func configureView() {
        
        let stackView = UIStackView()
        
        let valueLabel =  [nameLabel, capitalLabel, populationLabel, currenciesLabel]
        let titleLabels =  [LocalizedStringConstants.name, LocalizedStringConstants.capital, LocalizedStringConstants.population, LocalizedStringConstants.currencies]
        
        for (index, lable) in [nameTitleLabel, capitalTitleLabel, populationTitleLabel, currenciesTitleLabel].enumerated() {
            
            lable.text = titleLabels[index]
            let tempStackView = UIStackView(arrangedSubviews: [lable, valueLabel[index]])
            tempStackView.axis = .horizontal
            tempStackView.distribution = .fillEqually
            stackView.addArrangedSubview(tempStackView)
        }
        
        stackView.distribution = .fillEqually
        
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
    }
    
}
