//
//  NewyorkSchoolDetailView.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import Foundation

import SwiftUI

struct NewyorkSchoolDetailView: View {
    
   var newYorkSchoolModel: NewYorkSchoolModel
    
    var body: some View {
        VStack {
            Text(newYorkSchoolModel.overview_paragraph ?? "Details not available")
        }
        .padding()
    }
}

