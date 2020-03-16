//
//  ViewController.swift
//  LWToolsCalculator
//
//  Created by veimer on 3/13/20.
//  Copyright © 2020 Weimer. All rights reserved.
//

import UIKit

enum CalculatorType: String, CaseIterable {
    case circle
    case tube
    case rectangle
    case rectangleTube
    case angle
    case hexagon
    
    var title: String {
        return NSLocalizedString(rawValue, comment: "")
    }
    
    var image: UIImage? {
        return UIImage(named: rawValue)
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CalculatorType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeItemCollectionViewCell", for: indexPath) as! HomeItemCollectionViewCell
        let item = CalculatorType.allCases[indexPath.item]
        cell.label.text = item.title
        cell.imageView.image = item.image
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "CircleCalculatorViewController") as? CircleCalculatorViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let contentWidth = collectionView.bounds.width -
            layout.minimumInteritemSpacing -
            layout.sectionInset.left -
            layout.sectionInset.right
        let width = contentWidth / 2.0
        
        return CGSize(width: width, height: width)
    }
}
