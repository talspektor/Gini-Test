//
//  CellConfig.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import UIKit

public struct CellConfig {
    let height: CellHeight
    let color: CellColor
}

enum CellHeight {
    case zero
    case notZero
    
    func getHeight() -> CGFloat {
        switch self {
        case .zero:
            return 50.0
        case .notZero:
            return 100.0
        }
    }
}

enum CellColor {
    case red
    case orange
    
    func getColor() -> UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .orange:
            return UIColor.orange
        }
    }
}
