//
//  NetworkManager.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import Foundation

class NetworkManager {
    let stringUrl = "https://pastebin.com/raw/8wJzytQX"
    static let shared = NetworkManager()
    
    func fetchNumbers(completion: @escaping (Numbers) -> (Void)) {
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print("\(String(describing: error))")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let numbers = try JSONDecoder().decode(Numbers.self, from: data)
                print(numbers)
                completion(numbers)
            } catch let jsonError {
                print("Error serialize json", jsonError)
            }
        }.resume()
    }
}
