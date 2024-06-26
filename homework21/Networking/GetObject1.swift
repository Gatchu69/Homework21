//
//  GetObject.swift
//  homework21
//
//  Created by Nodiko Gachava on 24.04.24.
//

import UIKit

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class NetworkService {
    static var networkService = NetworkService()
    
    func getData<T: Decodable>(urlString: String, comletion: @escaping (Result<T,Error>) ->(Void)) {
        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            guard let data else { return }

            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    comletion(.success(object))
                }
            } catch {
                comletion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}
