//
//  BannerCollectionViewCell.swift
//  AirProject
//
//  Created by Saif Adel on 24/2/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "BannerCollectionViewCell"

    @IBOutlet weak var bannerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
       
        // Initialization code
    }
    
    public func configure (with image: UIImage){
        self.bannerImageView.image = image
        self.bannerImageView.layer.cornerRadius = 10
    }
    static func nib() -> UINib{
        return UINib(nibName:"BannerCollectionViewCell", bundle: nil)
    }

}
