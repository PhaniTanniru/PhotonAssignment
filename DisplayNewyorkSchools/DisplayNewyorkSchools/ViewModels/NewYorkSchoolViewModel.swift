//
//  NewYorkSchoolViewModel.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import Foundation
import Combine

class NewYorkSchoolViewModel: ObservableObject {
    
    private var dataManager: NewYorkSchoolsDataManaging?
    @Published var newyorkSchoolModelList: [NewYorkSchoolModel] = []
    
    init(dataManager: NewYorkSchoolsDataManaging? = NewYorkSchoolsDataManager()) {
        self.dataManager = dataManager
    }
    
    func fetchNewYorkSchools() {
        
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        
        dataManager?.fetchNewYorkSchools(urlString: urlString) { (schoolModelList, error) in
            
            if let schoolsList = schoolModelList {
                self.newyorkSchoolModelList = schoolsList
            } else {
                print("error fetching schools list \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
