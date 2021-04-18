//
//  InicioViewModel.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import Foundation

protocol InicioCoordinatorDelegate: class {
    func catalogoButtonTapped()
    func busquedaButtonTapped()
}

class InicioViewModel {
    
    weak var coordinatorDelegate: InicioCoordinatorDelegate?
    
    func catalogoButtonTapped() {
        coordinatorDelegate?.catalogoButtonTapped()
    }
    
    func busquedaButtonTapped() {
        coordinatorDelegate?.busquedaButtonTapped()
    }
}
