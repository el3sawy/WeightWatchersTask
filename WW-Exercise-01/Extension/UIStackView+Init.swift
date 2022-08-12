//
//  UIStackView+.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

extension UIStackView {
    
    convenience init(views:[UIView],
                     alignment: UIStackView.Alignment,
                     distribution: UIStackView.Distribution,
                     spacing:CGFloat) {
        
        self.init(frame: .zero)
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        _ =  views.map({self.addArrangedSubview($0)})
    }
    
    var makeVertical: UIStackView {
        axis = .vertical
        return self
    }
}
