//
//  Numbers.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import Foundation

struct Numbers: Decodable {
    let numbers: [Number]
}

struct Number: Decodable {
    let number: Int
}
