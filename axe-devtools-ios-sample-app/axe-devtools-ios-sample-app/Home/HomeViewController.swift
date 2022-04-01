//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()

    lazy var searchBarView: SearchBarView = {
        let sbv = SearchBarView()
        sbv.translatesAutoresizingMaskIntoConstraints = false
        return sbv
    }()

    lazy var homeScreenImageView: HomeImageView = {
        let hv = HomeImageView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    lazy var mostPopularItemsView: ItemCollectionView = {
        var mpv = ItemCollectionView()
        mpv.viewModel = MostPopularItemsViewModel()
        mpv.translatesAutoresizingMaskIntoConstraints = false
        return mpv
    }()

    lazy var collectionsView: AllCollectionsView = {
        let cv = AllCollectionsView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    lazy var recommendedItemsView: RecommendedItemsCollectionView = {
        let riv = RecommendedItemsCollectionView()
        riv.translatesAutoresizingMaskIntoConstraints = false
        return riv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        buildView()
    }

    private func buildView() {
        self.view.backgroundColor = UIColor(named: "LightGray")
        scrollView.backgroundColor = .clear
        contentView.backgroundColor = .clear

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(searchBarView)
        contentView.addSubview(homeScreenImageView)
        contentView.addSubview(mostPopularItemsView)
        contentView.addSubview(collectionsView)
        contentView.addSubview(recommendedItemsView)

        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)

        contentViewCenterY.priority = .defaultLow
        contentViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentViewCenterY,
            contentViewHeight,
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarView.heightAnchor.constraint(equalToConstant: 156),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeScreenImageView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 16),
            homeScreenImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenImageView.widthAnchor.constraint(equalToConstant: 327),
            homeScreenImageView.heightAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            mostPopularItemsView.topAnchor.constraint(equalTo: homeScreenImageView.bottomAnchor, constant: 32),
            mostPopularItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mostPopularItemsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mostPopularItemsView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.30),
        ])

        NSLayoutConstraint.activate([
            collectionsView.topAnchor.constraint(greaterThanOrEqualTo: mostPopularItemsView.bottomAnchor, constant: 24),
            collectionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            recommendedItemsView.topAnchor.constraint(greaterThanOrEqualTo: collectionsView.bottomAnchor, constant: 24),
            recommendedItemsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            recommendedItemsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            // not quite what we want, but getting closer..
            recommendedItemsView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.20),
            recommendedItemsView.widthAnchor.constraint(equalTo: view.widthAnchor),
            recommendedItemsView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
