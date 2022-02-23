//
//  FavoritesListVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        PersistenceManager.retrieveFavorites { result in
            switch result{
                
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}
