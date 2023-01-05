//
//  UIView+Ext.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
