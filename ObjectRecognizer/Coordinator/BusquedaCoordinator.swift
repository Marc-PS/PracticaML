//
//  BusquedaCoordinator.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class BusquedaCoordinator: Coordinator {
    let presenter: UINavigationController
    
    var busquedaViewModel: BusquedaViewModel?

    init(presenter: UINavigationController) { self.presenter = presenter }

    override func start() {
        let busquedaViewModel = BusquedaViewModel()
        let busquedaViewController = BusquedaViewController(viewModel: busquedaViewModel)
        busquedaViewController.title = NSLocalizedString("Busqueda", comment: "")
        self.busquedaViewModel = busquedaViewModel
        presenter.pushViewController(busquedaViewController, animated: false)
    }

    override func finish() {}
}
