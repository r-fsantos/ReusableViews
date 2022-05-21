//
//  ViewCode.swift
//  ReusableViews
//
//  Created by Renato F. dos Santos Jr on 20/05/22.
//

import Foundation


protocol ViewCode {
    func configureViews()
    func buildHierarchy()
    func setupConstraints()
    func setupViewCode()
}

extension ViewCode {
    func setupViewCode() {
        configureViews()
        buildHierarchy()
        setupConstraints()
    }
}
