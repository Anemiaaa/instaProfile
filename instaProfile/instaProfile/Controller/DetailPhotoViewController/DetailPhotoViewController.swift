//
//  DetailPhotoViewController.swift
//  instaProfile
//
//  Created by mac on 27.08.2021.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image {
            detailImage.image = image
        }
    }

    
    /// sets the image to the UIImageView outlet
    /// - Parameter image: image that will be assigned to the UIImageView outlet
    func config(image: UIImage?) {
        self.image = image
    }

}
