//
//  NewyorkSchoolsListView.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import SwiftUI

struct NewyorkSchoolsListView: View {
    
    @ObservedObject var viewModel: NewYorkSchoolViewModel
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.newyorkSchoolModelList, id: \.self) { (schoolModel) in
                                
                NavigationLink(destination: NewyorkSchoolDetailView(newYorkSchoolModel: schoolModel)) {
                    Text(schoolModel.school_name ?? "")
                }
            }
            .onAppear() {
                viewModel.fetchNewYorkSchools()
            }
        }.navigationTitle("Schools List")
       
    }
}

#Preview {
    NewyorkSchoolsListView(viewModel: NewYorkSchoolViewModel())
}
