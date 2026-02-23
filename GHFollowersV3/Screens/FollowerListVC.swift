import UIKit

class FollowerListVC: UIViewController {

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var userName: String!

    var followers: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        setUpCollectionView()
        fetchFollowers()
        setUpDataSource()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setUpViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    private func setUpCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UIHelpers.createThreeCollectionViewLayoutFlow(in: view)
        )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(
            FollowerCell.self,
            forCellWithReuseIdentifier: FollowerCell.reuseId
        )
    }


    private func fetchFollowers() {
        NetworkManager.shared.fetchFollowers(for: userName, page: 1) {
            [weak self] result in

            guard let self = self else { return }

            switch result {
            case .success(let followers):
                self.followers = followers
                self.updateData()
            case .failure(let error):
                self.showAlert(
                    title: "Sheet happend",
                    message: error.rawValue,
                    buttonTitle: "Ok"
                )

            }

        }
    }

    private func setUpDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(
            collectionView: collectionView,
            cellProvider: {
                (collectionView, indexPath, follower) -> UICollectionViewCell in
                let cell =
                    collectionView.dequeueReusableCell(
                        withReuseIdentifier: FollowerCell.reuseId,
                        for: indexPath
                    ) as! FollowerCell
                cell.set(follower: follower)
                return cell
            }
        )
    }

    private func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)

        }
    }
}
