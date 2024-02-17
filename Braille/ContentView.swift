import SwiftUI



struct ContentView: View {

    @State private var tabSelection = 2
    var body: some View {
        
//        ZStack(){
//            LearnOrTeach()
//            Image(systemName: "square.stack.3d.up")
//                .font(.system(size: 40))
//                .padding(40)
//            
//        }
        TabView(selection: $tabSelection){
            LearnOrTeach()
                .tag(1)
            TexttoBraille()
                .tag(2)
            Text("Tab Content 3")
                .tag(3)
            Text("Tab Content 4")
                .tag(4)
            Text("Tab Content 5")
                .tag(5)
        }.overlay(alignment: .bottom){
            CustomTabView(tabSelection: $tabSelection)
        }
        
    }
}


#Preview {
    ContentView()
}


