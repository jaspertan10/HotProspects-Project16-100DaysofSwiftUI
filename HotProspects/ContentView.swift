//
//  ContentView.swift
//  HotProspects
//
//  Created by Jasper Tan on 2/28/25.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {

        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}


struct TabsAndSelectingInListSandBox: View {
    
    // Selecting multiple tabs
    @State private var selection = Set<String>()
    let users = ["Tohru", "Yuki", "Kyo", "Momoiji"]
    
    //To change tabs programmatically:
//    Create an @State property to track the tab that is currently showing.
//    Modify that property to a new value whenever we want to jump to a different tab.
//    Pass that as a binding into the TabView, so it will be tracked automatically.
//    Tell SwiftUI which tab should be shown for each value of that property.
    @State private var selectedTab = "One"
    
    
    
    var body: some View {
        
        
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            
            Text("Tab 2")
            .tabItem {
                Label("Two", systemImage: "circle")
            }
            .tag("Two")
        }
        
        
        //Selecting multiple tabs
//        NavigationStack {
//            VStack {
//                List(users, id: \.self, selection: $selection) { user in
//                    Text(user)
//                }
//                
//                if selection.isEmpty == false {
//                    Text("You selected \(selection.formatted())")
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    EditButton()
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
