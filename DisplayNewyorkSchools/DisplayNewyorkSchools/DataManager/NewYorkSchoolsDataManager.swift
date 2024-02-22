//
//  NewYorkSchoolsDataManager.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import Foundation

protocol NewYorkSchoolsDataManaging {
    func fetchNewYorkSchools(urlString: String,  completion: @escaping ([NewYorkSchoolModel]?, Error?) -> Void)
}

class NewYorkSchoolsDataManager: NewYorkSchoolsDataManaging {
    func fetchNewYorkSchools(urlString: String, completion:  @escaping  ([NewYorkSchoolModel]?, Error?) -> Void) {
    
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                
                DispatchQueue.main.async {
                    print("no data")
                    completion(nil, nil)
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([NewYorkSchoolModel].self, from: data)
                DispatchQueue.main.async {
                    print("received data ")
                    completion(decodedData, nil)
                }
            } catch {
                print("error response")
                completion(nil, error)
            }
        }.resume()
    }

}
