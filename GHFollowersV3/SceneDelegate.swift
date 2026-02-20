import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return  UINavigationController(rootViewController: searchVC)
    }
    
    private func createFavouriteNC() -> UINavigationController {
        let favouriteListVC = FavouriteListVC()
        favouriteListVC.title = "Favourites"
        favouriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return UINavigationController(rootViewController: favouriteListVC)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().barTintColor = .systemGreen
        
        tabBar.viewControllers = [createSearchNC(), createFavouriteNC()]
        return tabBar
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
     
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
     
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
   
    }
    
    
}

