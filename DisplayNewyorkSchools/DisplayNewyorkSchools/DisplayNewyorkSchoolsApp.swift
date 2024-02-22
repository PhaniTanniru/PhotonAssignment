//
//  DisplayNewyorkSchoolsApp.swift
//  DisplayNewyorkSchools
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import SwiftUI

@main
struct DisplayNewyorkSchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = NewYorkSchoolViewModel()
            NavigationView {
                NewyorkSchoolsListView(viewModel: viewModel)
            }
        }
    }
}
