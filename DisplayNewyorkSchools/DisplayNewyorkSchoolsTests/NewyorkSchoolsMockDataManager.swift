//
//  NewyorkSchoolsMockDataManager.swift
//  DisplayNewyorkSchoolsTests
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import Foundation
@testable import DisplayNewyorkSchools

class NewyorkSchoolsMockDataManager: NewYorkSchoolsDataManaging {
    func fetchNewYorkSchools(urlString: String, completion: @escaping ([NewYorkSchoolModel]?, Error?) -> Void) {
        
        if let data = readLocalJSONFile(forName: "MockSchoolsResponse") {
            if let schoolsList = parse(jsonData: data) {
                completion(schoolsList, nil)
            } else {
                completion(nil, nil)
            }
        } else {
            completion(nil, nil)
        }
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            
            let bundle = BundleClass().bundle
          
            if let filePath = bundle.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> [NewYorkSchoolModel]? {
        do {
            let decodedData = try JSONDecoder().decode( [NewYorkSchoolModel].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }

}

class BundleClass {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
}

