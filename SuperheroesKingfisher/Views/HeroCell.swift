//
//  HeroCell.swift
//  SuperheroesKingfisher
//
//  Created by Zaki on 17.05.2023.
//

import UIKit
import Kingfisher

final class HeroCell: UICollectionViewCell {
    
    private let networkManager = NetworkManager.shared
    
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
//    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        activityIndicator  = showSpinner(in: heroImage)
    }
    
    func configure(with superhero: Superhero) {
        heroName.text = superhero.name
        let imageUrl = URL(string: superhero.images.lg)
        
        let processor = DownsamplingImageProcessor(size: heroImage.bounds.size)
        heroImage.kf.indicatorType = .activity
        heroImage.kf.setImage(with: imageUrl,
                              options: [
                                .processor(processor),
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                              ]
        ) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.lastPathComponent ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        
        
//        networkManager.fetchImage(from: imageUrl) {[weak self] result in
//            switch result {
//            case .success(let imageData):
//                self?.heroImage.image = UIImage(data: imageData)
//                self?.activityIndicator.stopAnimating()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
//    func showSpinner(in view: UIView) -> UIActivityIndicatorView {
//        let activityIndicator = UIActivityIndicatorView(style: .medium)
//        activityIndicator.color = .white
//        activityIndicator.startAnimating()
//        activityIndicator.center = view.center
//        activityIndicator.hidesWhenStopped = true
//        
//        view.addSubview(activityIndicator)
//        
//        return activityIndicator
//    }
    
}
