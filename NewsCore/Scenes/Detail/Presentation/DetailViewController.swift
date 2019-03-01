//
//  DetailViewController.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DetailViewControllerProvider: class {
    func detailViewController(with viewModel: ArticleViewModel) -> UIViewController
}

class DetailViewController: UIViewController {
    
    // MARK: - Private properties
    private let viewModel: ArticleViewModelType
    private let detailNavigator: DetailNavigator
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializers
    init(detailNavigator: DetailNavigator, viewModel: ArticleViewModelType) {
        self.viewModel = viewModel
        self.detailNavigator = detailNavigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "close-dark"), for: .normal)
        return button
    }()
    
    private lazy var articleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage())
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .gray
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var titleDescriptionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [authorLabel, dateLabel])
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, titleDescriptionStackView])
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .justified
        textView.dataDetectorTypes = .link
        textView.isSelectable = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundWhite

        setupUI()
        
        bindViewModel()
        
        closeButton.rx.tap
            .bind { [weak self] in
                self?.detailNavigator.dismiss(completion: nil)
            }
            .disposed(by: disposeBag)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - UI Setup
private extension DetailViewController {
    func setupUI() {
        view.addSubview(articleImageView)
        articleImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        view.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(articleImageView.snp.bottom).offset(16)
            make.height.equalTo(105)
        }
        
        view.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalTo(titleStackView.snp.bottom).offset(50)
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    func bindViewModel() {
        viewModel.outputs.image
            .drive(articleImageView.rx.image)
            .disposed(by: disposeBag)
        
        viewModel.outputs.author
            .drive(authorLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs.date
            .drive(dateLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs.content
            .drive(contentTextView.rx.text)
            .disposed(by: disposeBag)
    }
}
