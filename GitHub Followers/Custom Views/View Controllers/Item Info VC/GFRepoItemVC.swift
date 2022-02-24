//
//  GFRepoItemVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

protocol RepoItemVCDelegate: AnyObject{
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC{
    weak var delegate: RepoItemVCDelegate?
        
    
    init(user: User, delegate: RepoItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    

    
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "GetHub Profile", image: SFSymbols.person!)
    }
    
    
    override func actionButtonTapped() {
        delegate?.didTapGitHubProfile(for: user)
    }
}
