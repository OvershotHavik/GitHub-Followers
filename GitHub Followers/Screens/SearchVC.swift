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
    var logoImageViewTopConstraint: NSLayoutConstraint!
    
    var isUsernameEntered: Bool{
        //if usernameTF is empty, meaning nothing in it, return false, otherwise return true
        return !userNameTF.text!.isEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoIV, userNameTF, callToActionButton)
        configureLogoIV()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTF.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😅", buttonTitle: "OK")
            return
        }
        userNameTF.resignFirstResponder()
        
        let followerListVC = FollowersListVC(username: userNameTF.text!)
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    func configureLogoIV(){
        logoIV.translatesAutoresizingMaskIntoConstraints = false
        logoIV.image = Images.ghLogo
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8PlusZoomed ? 20 : 80
        logoImageViewTopConstraint = logoIV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant)
        logoImageViewTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            //y, x, width, hight. should have 4 constraints per item when appropriate
//            logoIV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoIV.heightAnchor.constraint(equalToConstant: 200),
            logoIV.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextField(){
        userNameTF.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: logoIV.bottomAnchor, constant: 48),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton(){
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
