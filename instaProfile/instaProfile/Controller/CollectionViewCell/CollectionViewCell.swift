//
//  CollectionViewCell.swift
//  instaProfile
//
//  Created by mac on 02.08.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CustomCell {
    @IBOutlet weak var cellImage: UIImageView!
    
    static func idCell() -> String {
        return String(describing: self)
    }
    
    /// sets the image to the UIImageView outlet
    /// - Parameter image: image that will be assigned to the UIImageView outlet
    
    func config(image: UIImage) {
        cellImage.image = image
    }
    

}
