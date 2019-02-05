//
//  TodayListViewController.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TodayListViewController: UIViewController {
    
    // Mark: - Constants
    enum Constants {
        static let columns: CGFloat = 1
        static let itemSpacing: CGFloat = 10
        static let itemHeight: CGFloat = 150
        static let cellName = "TodayCell"
    }
    
    private let viewModel: TodayListViewModelType
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: TodayListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        return spinner
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupCollectionView()
        setupNavigationBar()
        viewModelBindings()
    }
}

private extension TodayListViewController {
    var collectionViewItemWidth: CGFloat {
        let viewWidth: CGFloat = view.frame.size.width
        let totalSpacing: CGFloat = (Constants.columns - 1) * Constants.itemSpacing
        
        return (viewWidth - totalSpacing) / Constants.columns
    }
    
    func setupCollectionView() {
        collectionViewFlowLayout.itemSize = CGSize(width: collectionViewItemWidth, height: collectionViewItemWidth)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: Constants.cellName)
        collectionView.collectionViewLayout = collectionViewFlowLayout
        collectionView.backgroundView = activityIndicator
    }
    
    func setupNavigationBar() {
        title = "Today"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

private extension TodayListViewController {
    func viewModelBindings() {
        viewModel.outputs.articles
            .bind(to: collectionView.rx.items(cellIdentifier: Constants.cellName))
            { _, viewModel, cell in
                let cell = cell as! TodayCell
                cell.configure(viewModel)
            }
            .disposed(by: disposeBag)
        
    }
}
