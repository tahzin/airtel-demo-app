//
//  DynamicHeightTableView.swift
//  AirProject
//
//  Created by Saif Adel on 26/2/24.
//

import UIKit

final class DynamicHeightTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height + adjustedContentInset.top)
    }
}
