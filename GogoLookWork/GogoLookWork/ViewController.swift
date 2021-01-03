//
//  ViewController.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.width, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = .zero
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.white
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let viewModel = MainViewModel(dataSource: MainRemoteDataSource())

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel.fetchRequest { (ResponseBody, Error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.collectionView.reloadData()
            }
        }
    }

    func setUI() {
        view.addSubview(collectionView)
        collectionView.register(UINib(nibName: CollectionViewCell.reuseId, bundle: .main),
                                forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseId,
            for: indexPath) as? CollectionViewCell else {
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath)
        }
        cell.configure(viewModel.cellViewModel(at: indexPath))
        return cell
    }
}

extension UICollectionViewCell {
    static var reuseId: String { return "\(self)" }
}
