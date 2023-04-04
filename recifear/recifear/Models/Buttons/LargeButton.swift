//
//  LargeButton.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 03/04/23.
//

import SwiftUI

struct LargeButton: View {
    let title: String;
    let icon: Image;
    let action: () -> Void;
    
    var body: some View {
        Button (action: action) {
            HStack {
                Text(icon)
                    .foregroundColor(Color("background"))
                
                Text(title)
                    .foregroundColor(Color("background"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineSpacing(21.6)
                
            }.padding(.vertical, 15)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color("background"))
                .background(Color("accent"))
                .cornerRadius(12)
        }
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(title: "Baixar cartas para impressão", icon: Image(systemName:"square.and.arrow.down.fill")  , action: {
            print("click");
        }
        )
    }
}
