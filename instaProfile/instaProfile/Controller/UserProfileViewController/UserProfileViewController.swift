//
//  UserProfileViewController.swift
//  instaProfile
//
//  Created by mac on 01.08.2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var publicationsCountLabel: UILabel!
    @IBOutlet weak var subscribersCountLabel: UILabel!
    @IBOutlet weak var subscriptionsCountLabel: UILabel!
    @IBOutlet weak var userLogin: UILabel!
    
    let countCells = 3
    let offset: CGFloat = 2.0
    
    var user: User?
    var getCellData: ((_ indexPath: Int) -> UIImage)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setVariables()
        setFields()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerCustomCell(cell: CollectionViewCell.self)
    }
    
    
    /// sets the value to the class variables
    
    private func setVariables() {
        user = UsersDataBase.getUsersArray()?[0]
        getCellData = { [weak self] index in
            var uiImageArray: [UIImage] = []
                
            self?.user?.publications?.forEach({ str in
                    if let image = UIImage(named: str) {
                        uiImageArray.append(image)
                    }
                })
            
            if uiImageArray.count > 0 {
                return uiImageArray[index]
            }
            return UIImage()
        }
    }
    
    /// sets the value to the outlets
    
    private func setFields() {
        if let user = user {
            userImage.image = UIImage(named: user.avatar ?? "defaultAvatar")
            userImage.layer.cornerRadius = userImage.frame.width / 2
            userImage.clipsToBounds = true
            publicationsCountLabel.text = String(user.publications?.count ?? 0)
            subscribersCountLabel.text = String(user.followers)
            subscriptionsCountLabel.text = String(user.subscribes)
            userLogin.text = user.name
        }
    }
    
}

extension UserProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.publications?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.idCell(), for: indexPath) as? CollectionViewCell {
        
            if let image = getCellData?(indexPath.row) {
                cell.config(image: image)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCollectionView = collectionView.frame
        let widthCell = frameCollectionView.width / CGFloat(countCells)
        let spacing = CGFloat(countCells + 1) * offset / CGFloat(countCells)
        
        return CGSize(width: widthCell - spacing, height: widthCell - (offset * 2))
    }
    
    //MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailPhotoController = DetailPhotoViewController.loadFromNib()
        
        detailPhotoController.config(image: getCellData?(indexPath.row))
        present(detailPhotoController, animated: true, completion: nil)
    }
}
