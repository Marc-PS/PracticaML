//
//  CatalogoCellViewModel.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

protocol CatalogoCellViewModelViewDelegate: class {
    func catalogoImageFetched()
}

class CatalogoCellViewModel {
    
    weak var viewDelegate: CatalogoCellViewModelViewDelegate?
    var catalogoImage: UIImage?
    let name: String
    
    init(name: String) {
        self.name = name
        
        self.catalogoImage = UIImage(named: name)
        self.viewDelegate?.catalogoImageFetched()
        
//        DispatchQueue.main.async {
//            self.catalogoImage = UIImage(named: name)
//            self.viewDelegate?.catalogoImageFetched()
//        }
//        
    }
}
