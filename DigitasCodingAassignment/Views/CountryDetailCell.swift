//
//  CountryDetailCell.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

class CountryDetailCell: UITableViewCell {
    
    // MARK: - Internal Properties

    var countryInfo: CountryInfoModel? {
        didSet {
            self.updateUI()
        }
    }
    
    fileprivate let locationLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0

        return label
    }()
    
    fileprivate let borderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .gray
        label.numberOfLines = 0

        return label
    }()
    
    fileprivate let languagesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0

        return label
    }()

    fileprivate let locationTitleLabel: UILabel = {

        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray

        return label
    }()

    fileprivate let borderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        return label
    }()


    fileprivate let languagesTitleLabel: UILabel = {
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


    var location: String? {
        guard let countryInfo = countryInfo else { return nil }
        let lat = countryInfo.latlng?[0] ?? 0.0
        let long = countryInfo.latlng?[1] ?? 0.0
        return "\(lat), \(long)"
    }

    var borders: String? {
        guard let countryInfo = countryInfo else { return nil }
        let borders = countryInfo.borders?.joined(separator: ",")
         return borders
    }

    var languages: String? {
        guard let countryInfo = countryInfo else { return nil }
        let borders = countryInfo.languages?.joined(separator: ",")
        return borders
    }


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
        guard countryInfo != nil else { return }
        locationLabel.text = location
        borderLabel.text = borders
        languagesLabel.text = languages
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

extension CountryDetailCell {
    
    func configureUI() {
        
        configureView()
    }
    
    func configureView() {

        let stackView = UIStackView()

        let valueLabel =  [locationLabel, borderLabel, languagesLabel]
        let titleLabels =  [LocalizedStringConstants.location, LocalizedStringConstants.borders, LocalizedStringConstants.languages]

        for (index, lable) in [locationTitleLabel, borderTitleLabel, languagesTitleLabel].enumerated() {

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
