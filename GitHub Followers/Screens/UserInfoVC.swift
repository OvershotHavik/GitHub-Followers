//
//  UserInfoVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject{
    func didRequestFollowers(for username: String)
}

class UserInfoVC: GFDataLoadingVC {
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    var username: String!
    weak var delegate: UserInfoVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        getUserInfo()
        configureScrollView()
    }
    
    
    func configureVC(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func configureScrollView(){
        view.addSubview(scrollView)
        scrollView.pinToEdges(of: view)
        
        scrollView.addSubview(contentView)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 610)
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    
    func configureUIElements(with user: User){
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: GFFollowerItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
        print(user)
    }
    
    
    func layoutUI(){
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        for itemView in itemViews{
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}


extension UserInfoVC: RepoItemVCDelegate{
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid.", buttonTitle: "OK")
            return
        }
        presentSafariVC(with: url)
    }
}



extension UserInfoVC: FollowerItemVCDelegate{
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else{
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers. What a shame 😞", buttonTitle: "So sad")
            return
        }
        delegate?.didRequestFollowers(for: user.login)
        dismissVC()
    }
}
