//
//  TableViewExtension.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let className =  String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func dequeReusableCell<T>(_ type: T.Type) -> T? {
        let className =  String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}

public extension UITableViewCell {
    
    @objc class var identifier: String {
        return String(describing: self)
    }
}
