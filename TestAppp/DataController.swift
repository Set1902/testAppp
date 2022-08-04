//
//  DataController.swift
//  TestAppp
//
//  Created by Sergei Kovalev on 03.08.2022.
//

import Foundation



class DataController {
    
    static let shared = DataController()
    
    let url = URL(string: "https://pryaniky.com/static/json/sample.json")
    
    func fetchDatum( completion: @escaping ((Result<[Datum], Error>) -> Void)) {
        
        
        
        
        let task = URLSession.shared.dataTask(with: url!)
        { (data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let DatumResponse = try jsonDecoder.decode(Welcome.self, from: data)
                    completion(.success(DatumResponse.data))
                }
                catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    
    func fetchViews(completion: @escaping ((Result<[String], Error>) -> Void)) {
        
        let task = URLSession.shared.dataTask(with: url!)
        { (data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let DatumResponse = try jsonDecoder.decode(Welcome.self, from: data)
                    completion(.success(DatumResponse.view))
                }
                catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    

    
}
