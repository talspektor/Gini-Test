//
//  ViewController.swift
//  Gini-Test
//
//  Created by Tal talspektor on 18/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registercell()
        viewModel = ViewModel()
        viewModel.fetchNumbers { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    private func registercell() {
        collectionView.register(MyCollectionViewCell.getNib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numbers?.numbers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setLabel(with: "\(viewModel.numbers?.numbers[indexPath.item].number ?? 0)")
        // get the cell configuration from the view model
        let cellConfig = viewModel.configCell(with: indexPath.item)
        // set cell configuration
        cell.setHeigt(cellConfig.height.getHeight())
        cell.setColor(cellConfig.color.getColor())
        return cell
    }
}

