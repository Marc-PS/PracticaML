//
//  BusquedaViewController.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class BusquedaViewController: UIViewController {

    
    // MARK: - Class properties
    let viewModel: BusquedaViewModel
    
    // MARK: - Outlets
    

    
    // MARK: - Lifecycle
    init(viewModel: BusquedaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setupOutlets()
    }


    // MARK: - Actions
    
    

    // MARK: - Class functionalities
    
    private func setupOutlets(){
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent      = true
        self.navigationController?.navigationBar.isOpaque           = true
        self.navigationController?.navigationBar.backgroundColor    = UIColor.white
        self.navigationController?.navigationBar.layer.shadowRadius  = 1
        self.navigationController?.navigationBar.layer.shadowOffset  = CGSize(width: 0, height: 2)
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowColor   = UIColor.gray.cgColor
    }
    
}

