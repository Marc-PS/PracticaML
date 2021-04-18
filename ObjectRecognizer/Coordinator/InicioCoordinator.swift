//
//  InicioCoordinator.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class InicioCoordinator: Coordinator {
    let presenter: UINavigationController
    
    var inicioViewModel: InicioViewModel?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    override func start() {
        let inicioViewModel = InicioViewModel()
        let inicioViewController = InicioViewController(viewModel: inicioViewModel)
        inicioViewController.title = NSLocalizedString("Inicio", comment: "")
        inicioViewModel.coordinatorDelegate = self
        self.inicioViewModel = inicioViewModel
        presenter.pushViewController(inicioViewController, animated: false)
    }

    override func finish() {}
}

extension InicioCoordinator: InicioCoordinatorDelegate {

    func catalogoButtonTapped() {
        let catalogoCoordinator = CatalogoCoordinator(presenter: presenter)
        addChildCoordinator(catalogoCoordinator)
        catalogoCoordinator.start()
        
    }
    
    func busquedaButtonTapped() {
        let busquedaCoordinator = BusquedaCoordinator(presenter: presenter)
        addChildCoordinator(busquedaCoordinator)
        busquedaCoordinator.start()
    }
    

}
