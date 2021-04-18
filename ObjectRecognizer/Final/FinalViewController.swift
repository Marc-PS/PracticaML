//
//  FinalViewController.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import Vision
import UIKit
import AVFoundation

class FinalViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    
    // MARK: - Class properties
    let viewModel: FinalViewModel
    
    var bufferSize: CGSize = .zero
    var rootLayer: CALayer! = nil

    
    // MARK: - Outlets
    
    lazy var photo: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.alpha = 1
        view.image = UIImage(named: viewModel.name)
        
        return view
    }()
    
    lazy var inicio: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("Inicio", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()

    
    // MARK: - Lifecycle
    init(viewModel: FinalViewModel) {
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
        view.addSubview(photo)
        view.addSubview(inicio)
        setupOutlets()
    }

    

    // MARK: - Actions
    @objc func inicioButtonTapped() {
        viewModel.inicioButtonTapped()
    }
    

    // MARK: - Class functionalities
    
    private func setupOutlets(){
        setupPhoto()
        setupInicioButton()
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
    

    private func setupPhoto(){
       
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        photoAnalized()
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let size = screenWidth - 40
        
        NSLayoutConstraint.activate([
            
            photo.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            photo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            photo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            photo.heightAnchor.constraint(equalToConstant: CGFloat(size))
        
        ])
        
    }
    
    private func setupInicioButton(){
       
        inicio.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            inicio.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 169),
            inicio.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120),
            inicio.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120),
            inicio.heightAnchor.constraint(equalToConstant: 69)
        
        ])
        
       
        inicio.addTarget(self, action: #selector(inicioButtonTapped), for: .touchUpInside)
    }
            
        
    
}


extension FinalViewController: FinalViewModelViewDelegate {
    func photoAnalized() {
        print("Hola")
    }
    
    
    
    
}






