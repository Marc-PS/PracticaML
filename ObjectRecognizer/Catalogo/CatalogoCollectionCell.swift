//
//  CatalogoCollectionCell.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//


import UIKit

class CatalogoCollectionCell: UICollectionViewCell {
    
    // MARK: - Class properties
    var viewModel: CatalogoCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            
            if let image = viewModel.catalogoImage{
                self.collectionItem.updateImage(image: image)
            }
        }
    }
    
    // MARK: - Outlets
    lazy var collectionItem: CatalogoCollectionItem = {
        let view = CatalogoCollectionItem()
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        collectionItem.prepareForReuse()
    }
    
    
    // MARK: - Class functionalities
    private func setupOutlets(){
        self.contentView.addSubview(collectionItem)
        self.collectionItem.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionItem.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionItem.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionItem.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionItem.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
}


extension CatalogoCollectionCell: CatalogoCellViewModelViewDelegate {
    func catalogoImageFetched() {
        guard let viewModel = self.viewModel else { return}
        if let image = viewModel.catalogoImage{
            self.collectionItem.updateImage(image: image)
            
        }
        
        setNeedsLayout()
    }
}

