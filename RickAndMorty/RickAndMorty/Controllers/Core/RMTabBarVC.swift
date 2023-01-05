//
//  RMTabBarVC.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 05.01.2023.
//

import UIKit

/// Controller to house tabs and root tab controllers
final class RMTabBarVC: UITabBarController {

    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabBar()
    }
    
    // MARK: - Setup methods
    
    private func createNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.largeTitleDisplayMode = .automatic
        rootViewController.title = title
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
    
    private func setUpTabBar() {
        let charactersVC = RMCharacterVC()
        let episodesVC = RMEpisodeVC()
        let locationsVC = RMLocationVC()
        let settingsVC = RMSettingsVC()
        
        viewControllers = [
            createNavigationController(rootViewController: charactersVC,
                                       title: "Characters",
                                       image: UIImage(systemName: "person")),
            createNavigationController(rootViewController: episodesVC,
                                       title: "Episodes",
                                       image: UIImage(systemName: "globe.americas")),
            createNavigationController(rootViewController: locationsVC,
                                       title: "Locations",
                                       image: UIImage(systemName: "tv")),
            createNavigationController(rootViewController: settingsVC,
                                       title: "Settings",
                                       image: UIImage(systemName: "gearshape"))
        ]
        
        setViewControllers(
            viewControllers,
            animated: true
        )
    }
    
}
