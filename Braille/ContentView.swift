import SwiftUI



struct ContentView: View {

    @State private var tabSelection = 0
    var body: some View {
        
        TabView(selection: $tabSelection){
            Introduction()
                .tag(1)
            LearnOrTeach()
                .tag(2)
            TexttoBraille()
                .tag(3)
            Text("Tab Content 3")
                .tag(4)
            Text("Tab Content 4")
                .tag(5)
        }.overlay(alignment: .bottom){
            CustomTabView(tabSelection: $tabSelection)
        }
        
    }
}


#Preview {
    ContentView()
}


