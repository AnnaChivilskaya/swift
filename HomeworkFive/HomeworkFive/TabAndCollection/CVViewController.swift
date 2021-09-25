//
//  CVViewController.swift
//  HomeworkFive
//
//  Created by Аня on 25.09.2021.
//

import UIKit

class CVViewController: UIViewController {
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let layout = CollectionViewCustomLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        spisok()
    }
    
    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = self.layout
    }
    
    private func spisok() {
        let array = ["Egorov Anton", "Kram Viktor", "Antonov Egor", "Alekseev Dima", "Kram Nastya"]

        var dict: [Character: [String]] = [:]
        
        array.forEach {
            
            guard let letter = $0.first else {return}
            
            if dict[letter] == nil {
                dict[letter] = [$0]
            } else {
                dict[letter]!.append($0)
            }
        }
        
        dict.keys.forEach {
            print(dict[$0]?.count)
        }
    }
}

extension CVViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
}
