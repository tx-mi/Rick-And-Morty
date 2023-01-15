//
//  RMEpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 15.01.2023.
//

import UIKit

/// VC showing detail of episode
final class RMEpisodeDetailVC: UIViewController {

    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var url: URL?
    
    // MARK: - init
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods

}
