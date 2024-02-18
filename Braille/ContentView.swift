import SwiftUI



struct ContentView: View {

    @State private var tabSelection = 1
    var body: some View {
        
        TabView(selection: $tabSelection){
            Introduction()
                .tag(1)
            LearnOrTeach()
                .tag(2)
            TexttoBraille()
                .tag(3)
            info()
                .tag(4)
        }.overlay(alignment: .bottom){
            CustomTabView(tabSelection: $tabSelection)
        }
        
    }
}


#Preview {
    ContentView()
}


