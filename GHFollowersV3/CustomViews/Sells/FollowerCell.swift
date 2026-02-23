//
//  CollectionViewCell.swift
//  GHFollowersV3
//
//  Created by Владилсав on 20/2/26.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseId = "FollowersCell"

    let avatarImage = GFAvatarImageView(frame: .zero)
    let nameLabel = GFTitle(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        nameLabel.text = follower.login
    }

    private func setup() {
        addSubview(avatarImage)
        addSubview(nameLabel)
        let padding: CGFloat = 8

        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(
                equalTo: topAnchor,
                constant: padding
            ),
            avatarImage.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            avatarImage.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: padding
            ),
            avatarImage.heightAnchor.constraint(
                equalTo: avatarImage.widthAnchor
            ),

            nameLabel.topAnchor.constraint(
                equalTo: avatarImage.bottomAnchor,
                constant: 12
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -padding
            ),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),

        ])

    }

}
