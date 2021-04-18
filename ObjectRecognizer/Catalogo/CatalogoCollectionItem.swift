//
//  CatalogoCollectionItem.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class CatalogoCollectionItem: UIView {

    // MARK: - Outlets
    private lazy var itemImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.alpha = 1
        
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItemImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Class functionalities UI related
    
    private func setupItemImage(){
        addSubview(itemImage)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.topAnchor),
            itemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func updateImage(image: UIImage){
        self.itemImage.image = image
        setNeedsLayout()
    }
    
    func prepareForReuse(){
        self.itemImage.image = nil
    }
}
