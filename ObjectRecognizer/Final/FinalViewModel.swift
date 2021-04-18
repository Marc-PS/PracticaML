//
//  FinalViewModel.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import Foundation

protocol FinalViewModelCoordinatorDelegate: class {
    func inicioButtonTapped()
}

protocol FinalViewModelViewDelegate: class {
    func photoAnalized()
}

class FinalViewModel {
    
    let name: String
    
    weak var coordinatorDelegate: FinalViewModelCoordinatorDelegate?
    weak var viewDelegate: FinalViewModelViewDelegate?
    
    init(name: String) {
        self.name = name
    }
    
    
    
    func photoAnalized() {
        viewDelegate?.photoAnalized()
    }
    
    func inicioButtonTapped() {
        coordinatorDelegate?.inicioButtonTapped()

    }
}
