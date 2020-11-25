//
//  ViewNodel.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import Foundation

class ViewModel {

    var numbers: Numbers?
    
    func fetchNumbers(completion: @escaping () -> Void) {
        let manager = NetworkManager.shared
        manager.fetchNumbers { numbers in
            self.numbers = numbers
            completion()
        }
    }
    
    func configCell(with index: Int) -> CellConfig {
        if (numbers?.numbers[index].number ?? 0) % 10 == 0 {
            return CellConfig(height: CellHeight.zero, color: CellColor.red)
        }
        return CellConfig(height: CellHeight.notZero, color: CellColor.orange)
    }
}
