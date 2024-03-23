//
//  Inroduction.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct IntroductionTemp: View {
    
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        
        HStack(spacing: 17) {
            Image(systemName: imageName)
                .scaledToFit()
                .font(.system(size: 25))
                .frame(width: 40, height: 40)
                .padding(8)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .foregroundColor(Color("Color 3"))
                }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .lineSpacing(-10)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

