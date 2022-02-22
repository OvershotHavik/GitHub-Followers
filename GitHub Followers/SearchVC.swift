//
//  SearchVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class SearchVC: UIViewController {

    let logoIV = UIImageView()
    let userNameTF = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoIV()
        configureTextField()
        configureCallToActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func configureLogoIV(){
        view.addSubview(logoIV)
        logoIV.translatesAutoresizingMaskIntoConstraints = false
        logoIV.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            //y, x, width, hight. should have 4 constraints per item when appropriate
            logoIV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoIV.heightAnchor.constraint(equalToConstant: 200),
            logoIV.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextField(){
        view.addSubview(userNameTF)
        
        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: logoIV.bottomAnchor, constant: 48),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
