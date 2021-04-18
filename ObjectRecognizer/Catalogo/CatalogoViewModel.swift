//
//  CatalogoViewModel.swift
//  ObjectRecognizer
//
//  Created by Marc Perelló Sapiña on 10/4/21.
//

import Foundation

protocol CatalogoViewModelCoordinatorDelegate: class {
    func didSelect(name: String)
}

protocol CatalogoViewModelViewDelegate: class {
    func catalogoWasFetched()
    func errorFetchingCatalogo()
}


class CatalogoViewModel {
    weak var coordinatorDelegate: CatalogoViewModelCoordinatorDelegate?
    weak var viewDelegate: CatalogoViewModelViewDelegate?
    var catalogoViewModels: [CatalogoCellViewModel] = []
   
   
    func viewWasLoaded() {
        DispatchQueue.global(qos: .userInitiated).async {
            for indice in 1...174 {
                let name = "photo\(indice)"
                self.catalogoViewModels.append(CatalogoCellViewModel(name: name))
                print(indice)
            }
            DispatchQueue.main.async {
                self.viewDelegate?.catalogoWasFetched()
            }
          
        }
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return catalogoViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CatalogoCellViewModel? {
        guard indexPath.row < catalogoViewModels.count else { return nil }
        return catalogoViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        coordinatorDelegate?.didSelect(name: catalogoViewModels[indexPath.row].name)
    }
}
