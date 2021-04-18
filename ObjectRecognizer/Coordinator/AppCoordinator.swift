//
//  AppCoordinator.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    init(window: UIWindow) { self.window = window }
    
    override func start() {
        
        let inicioNavigationController = UINavigationController()
        let inicioCoordinator = InicioCoordinator(presenter: inicioNavigationController)
        
        addChildCoordinator(inicioCoordinator)
        inicioCoordinator.start()
        
    
        window.rootViewController = inicioNavigationController
        window.makeKeyAndVisible()
    }
    
    override func finish() {}
}
