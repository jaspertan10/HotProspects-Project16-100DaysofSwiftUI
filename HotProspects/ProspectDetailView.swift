//
//  ProspectDetailView.swift
//  HotProspects
//
//  Created by Jasper Tan on 3/17/25.
//

import SwiftUI

struct ProspectDetailView: View {
    
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            Section("Contact Name") {
                TextField("Name", text: $prospect.name)
            }
            
            Section("Contact Email") {
                TextField("Email", text: $prospect.emailAddress)
            }
            
            Toggle("Prospect Contacted", isOn: $prospect.isContacted)
        }
    }
}

#Preview {
    
    ProspectDetailView(prospect: Prospect(name: "Jane Doe", emailAddress: "jane.doe@gmail.com", isContacted: false))
}
