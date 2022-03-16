//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var searchBarView: SearchBarView = {
        let sbv = SearchBarView()
        sbv.translatesAutoresizingMaskIntoConstraints = false
        return sbv
    }()

    lazy var homeView: HomeView = {
        let hv = HomeView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    lazy var mostPopularItemsView: MostPopularItemsView = {
        let mpv = MostPopularItemsView()
        mpv.translatesAutoresizingMaskIntoConstraints = false
        return mpv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        buildView()
    }

    private func buildView() {
        self.view.addSubview(searchBarView)
        self.view.addSubview(homeView)
        self.view.addSubview(mostPopularItemsView)
        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            self.searchBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.searchBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.searchBarView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.searchBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.homeView.topAnchor.constraint(equalTo: self.searchBarView.bottomAnchor, constant: 16),
            self.homeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            self.homeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
         //   self.homeView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            self.mostPopularItemsView.topAnchor.constraint(equalTo: self.homeView.bottomAnchor, constant: 32),
            self.mostPopularItemsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.mostPopularItemsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.mostPopularItemsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        ])
    }
}
