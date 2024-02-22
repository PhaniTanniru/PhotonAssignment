//
//  NewYorkSchoolModel.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import Foundation

struct NewYorkSchoolModel: Codable, Identifiable, Hashable {
    var dbn: String?
    var school_name: String?
    var overview_paragraph: String?
    var academicopportunities1: String?
    var academicopportunities2: String?
    var id: String {
        return school_name ?? UUID().uuidString
    }
}
