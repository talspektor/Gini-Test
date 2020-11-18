//
//  ZeroCollectionViewCell.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    static let identifier = "zeroCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "ZeroCollectionViewCell", bundle: nil)
    }
    
    func setLabel(with text: String) {
        label.text = text
    }
    
    func setColor(_ color: UIColor) {
        mainView.backgroundColor = color
    }
    
    func setHeigt(_ height: CGFloat) {
        heightConstraint.constant = height
    }
}
