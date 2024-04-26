//
//  CountriesViewModel.swift
//  homework21
//
//  Created by Nodiko Gachava on 25.04.24.
//

import Foundation

protocol CountriesViewModelDelegate: AnyObject {
    func countriesFetched(_ countries: [Country])
}

class CountriesViewModel {
    let urlString = "https://restcountries.com/v3.1/all"
    var countriesArray = [Country]()
    weak var delegate: CountriesViewModelDelegate?
    var viewT: CountriesViewController?
    
    func viewDidLoad(){
        getData()
    }
    
    private func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let success):
                self.countriesArray = success
                self.viewT?.countriesTableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        self.delegate?.countriesFetched(self.countriesArray)
    }
}
