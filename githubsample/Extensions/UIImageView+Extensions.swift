//
//  UIImageView+Extensions.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 31/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(from url: URL, placeholder: UIImage?) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let data = data, let downloadedImage = UIImage(data: data) else {
                    self.image = placeholder
                    return
                }
                
                self.image = downloadedImage
            }
        }.resume()
    }
    
}
