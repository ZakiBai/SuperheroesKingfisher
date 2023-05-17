//
//  MainCollectionViewController.swift
//  SuperheroesKingfisher
//
//  Created by Zaki on 17.05.2023.
//

import UIKit
import Kingfisher

final class MainCollectionViewController: UICollectionViewController {
    
    private var superheroes: [Superhero] = []
    private let networkManager = NetworkManager.shared
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperheroes()
    }


    @IBAction func clearCacheButtonTapped(_ sender: UIBarButtonItem) {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache {
            print("Done")
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superheroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath)
        guard let cell = cell as? HeroCell else { return UICollectionViewCell() }
        let superhero = superheroes[indexPath.row]
        cell.configure(with: superhero)
        return cell
    }

    // MARK: - Network Manager
    private func fetchSuperheroes() {
        networkManager.fetchData { result in
            switch result {
            case .success(let superheroes):
                self.superheroes = superheroes
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}




