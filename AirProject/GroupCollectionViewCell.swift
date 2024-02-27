//
//  GroupCollectionViewCell.swift
//  AirProject
//
//  Created by Saif Adel on 25/2/24.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    static let identifier = "GroupCollectionViewCell"

    @IBOutlet weak var groupUIImageView: UIImageView!
    
    @IBOutlet weak var groupItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.groupUIImageView.layer.cornerRadius = 10
    }
    
   // public func setName(name: String) {
    //    self.label.text = name
        
   // }
    
    public func configure(model: GroupModel) {
        self.groupUIImageView.image = model.image
        self.groupItemName.text = model.title
 }
    
    static func nib() -> UINib{
        return .init(nibName: "GroupCollectionViewCell", bundle: nil)
        
    }

}
