//
//  CustomTabView.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("rectangle.inset.filled.and.person.filled","Introduction"),
        ("book.pages","Learn"),
        ("hand.point.up.braille","Translate"),
        ("gear","Setting")
    ]
    
    var body: some View {
        ZStack{
            Capsule()
                .frame(height: 60)
                .foregroundColor(Color("navtabcolor"))
                .shadow(radius: 2)
            
            HStack(spacing: 0) {
                ForEach(0..<4) { index in ///navbar counter
                    Button {
                        withAnimation {
                            tabSelection = index + 1
                        }
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            Image(systemName: tabBarItems[index].image)
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            if index + 1 == tabSelection {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "TabIndicator", in: animationNamespace)
                            } else {
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(height: 2)
                            }
                        }.foregroundColor(index + 1 == tabSelection ? .blue : .white).bold()
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(height: 50)
            .clipShape(Capsule())
        }.padding(.horizontal)
    }
}

