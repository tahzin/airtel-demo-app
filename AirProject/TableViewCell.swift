//
//  TableViewCell.swift
//  AirProject
//
//  Created by Saif Adel on 26/2/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    @IBOutlet weak var tableCellView: UIView!
    @IBOutlet weak var tableCellImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableCellImageView.layer.cornerRadius = 15
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}
