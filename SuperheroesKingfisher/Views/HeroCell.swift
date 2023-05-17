//
//  HeroCell.swift
//  SuperheroesKingfisher
//
//  Created by Zaki on 17.05.2023.
//

import UIKit

final class HeroCell: UICollectionViewCell {
    
    private let networkManager = NetworkManager.shared
    
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator  = showSpinner(in: heroImage)
    }
    
    func configure(with superhero: Superhero) {
        heroName.text = superhero.name
        let imageUrl = URL(string: superhero.images.lg)!
        
        networkManager.fetchImage(from: imageUrl) {[weak self] result in
            switch result {
            case .success(let imageData):
                self?.heroImage.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
}
