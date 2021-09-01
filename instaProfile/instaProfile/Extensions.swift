//
//  Extensions.swift
//  instaProfile
//
//  Created by mac on 02.08.2021.
//

import Foundation
import UIKit

protocol CustomCell {
    static func idCell() -> String
}

extension UICollectionViewCell {
    func nibName() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UICollectionView {
    //func config(){}
    func registerCustomCell(cell: CustomCell.Type) {
        self.register(UINib(nibName: String(describing: cell), bundle: nil), forCellWithReuseIdentifier: cell.idCell())
    }
}

extension UIViewController {
//    static func loadFromNib<T: UIViewController>() -> T {
//        return T.init(nibName: String(describing: T.self), bundle: nil)
//    }
//    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
