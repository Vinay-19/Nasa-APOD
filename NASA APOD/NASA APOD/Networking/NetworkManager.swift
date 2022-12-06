//
//  NetworkManager.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import Foundation

protocol NetworkManagerDelegate{
    
    func didUpdateNasaAPOD(apodData: NasaData)
    func didFailWithError(error: Error)
    
}

struct NetworkManager {

    var delegate: NetworkManagerDelegate?
    
    func performRequest() {
        
        guard let url = URL.nasaApodURL() else {
            return
        }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, response, error)in
            
            if let safeData = data  {
                
                if let decodedData = self.parseJSON(apodData: safeData) {
                    self.delegate?.didUpdateNasaAPOD(apodData: decodedData)
                }
                
            }
            
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            
        }
        dataTask.resume()
        
        
    }
    
    
    func parseJSON(apodData: Data) -> NasaData? {
        do{
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(NasaData.self, from: apodData)
            return decodedData
            
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
