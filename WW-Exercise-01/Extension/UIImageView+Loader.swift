//
//  UIImageView+.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func load(with url: String?) {
        let placeholderImage = UIImage(named: "dummy")
        guard let imageURLString = url,
                let fullURLString = URL(string: DomainURL.production.path + imageURLString) else {
            self.image = placeholderImage
            return
        }
        af.setImage(withURL: fullURLString, placeholderImage: placeholderImage)
    }
}
