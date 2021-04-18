//
//  InicioViewController.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import UIKit

class InicioViewController: UIViewController {

    
    // MARK: - Class properties
    let viewModel: InicioViewModel
    
    // MARK: - Outlets
    
    lazy var catalogo: UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitle("Catalogo", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    lazy var busqueda: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("Busqueda", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()

    
    // MARK: - Lifecycle
    init(viewModel: InicioViewModel) {
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
        view.addSubview(catalogo)
        view.addSubview(busqueda)
        setupOutlets()
    }

    

    // MARK: - Actions
    @objc func catalogoButtonTapped() {
        viewModel.catalogoButtonTapped()
    }
    
    @objc func busquedaButtonTapped() {
        viewModel.busquedaButtonTapped()
    }
    

    // MARK: - Class functionalities
    
    private func setupOutlets(){
        setupCatalogoButton()
        setupBusquedaButton()
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
    

    private func setupCatalogoButton(){
       
        catalogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            catalogo.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 220),
            catalogo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120),
            catalogo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120),
            catalogo.heightAnchor.constraint(equalToConstant: 69)
        
        ])
        
       
        catalogo.addTarget(self, action: #selector(catalogoButtonTapped), for: .touchUpInside)
    }
    
    private func setupBusquedaButton(){
       
        busqueda.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            busqueda.topAnchor.constraint(equalTo: catalogo.bottomAnchor, constant: 169),
            busqueda.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120),
            busqueda.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120),
            busqueda.heightAnchor.constraint(equalToConstant: 69)
        
        ])
        
       
        busqueda.addTarget(self, action: #selector(busquedaButtonTapped), for: .touchUpInside)
    }
}
