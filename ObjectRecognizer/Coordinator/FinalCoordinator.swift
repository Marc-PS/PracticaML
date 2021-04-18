//
//  FinalCoordinator.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class FinalCoordinator: Coordinator {
    let presenter: UINavigationController
    let name: String
    var finalViewModel: FinalViewModel?

    init(presenter: UINavigationController, name: String) {
        self.presenter = presenter
        self.name = name
    }

    override func start() {
        let finalViewModel = FinalViewModel(name: name)
        let finalViewController = FinalViewController(viewModel: finalViewModel)
        finalViewController.title = NSLocalizedString("Final", comment: "")
        finalViewModel.viewDelegate = finalViewController
        finalViewModel.coordinatorDelegate = self
        self.finalViewModel = finalViewModel
        presenter.pushViewController(finalViewController, animated: false)
    }

    override func finish() {}
}

extension FinalCoordinator: FinalViewModelCoordinatorDelegate {
    func inicioButtonTapped() {
        let inicioCoordinator = InicioCoordinator(presenter: presenter)
        addChildCoordinator(inicioCoordinator)
        inicioCoordinator.start()
    }
    
    
    
}
