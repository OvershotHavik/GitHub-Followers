//
//  GFFollowerItemVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit
protocol FollowerItemVCDelegate: AnyObject{
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC{
    
    weak var delegate: FollowerItemVCDelegate?
    
    
    init(user: User, delegate: FollowerItemVCDelegate){
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
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", image: SFSymbols.search!)
    }
    
    
    override func actionButtonTapped() {
        delegate?.didTapGetFollowers(for: user)
    }
}
