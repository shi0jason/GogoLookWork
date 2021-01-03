//
//  ViewController.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRequest()
        setUI()
    }

    func setUI() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
