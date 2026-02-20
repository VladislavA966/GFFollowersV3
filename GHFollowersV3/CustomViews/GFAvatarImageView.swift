//
//  GFAvatarImageView.swift
//  GHFollowersV3
//
//  Created by Владилсав on 20/2/26.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let imagePlaceholder = UIImage(named: "avatar-placeholder")
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        clipsToBounds = true
        image = imagePlaceholder
    }
    

}
