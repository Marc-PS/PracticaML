//
//  CatalogoCoordinator.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class CatalogoCoordinator: Coordinator {
    let presenter: UINavigationController
    
   
    init(presenter: UINavigationController) { self.presenter = presenter }

    override func start() {
        let catalogoViewModel = CatalogoViewModel()
        let catalogoViewController = CatalogoViewController(viewModel: catalogoViewModel)
        catalogoViewController.title = NSLocalizedString("Catalogo", comment: "")
        catalogoViewModel.viewDelegate = catalogoViewController
        catalogoViewModel.coordinatorDelegate = self
        presenter.pushViewController(catalogoViewController, animated: false)
    }

    override func finish() {}
}

extension CatalogoCoordinator: CatalogoViewModelCoordinatorDelegate {
    func didSelect(name: String) {
        let finalViewModel = FinalViewModel(name: name)
        let finalViewController = FinalViewController(viewModel: finalViewModel)
        finalViewModel.viewDelegate = finalViewController
        finalViewController.title = NSLocalizedString(name, comment: "")
        presenter.pushViewController(finalViewController, animated: true)
    }
}
