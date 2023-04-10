//
//  teste.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 04/04/23.
//

import SwiftUI

struct teste: View {
    @State private var buttonState = false
    var body: some View {
        Button(action: {
                    self.buttonState.toggle()
                }) {
                    Text(buttonState ? Image(systemName: "heart.fill") : Image(systemName: "star"))
                        .foregroundColor(buttonState ? .green : .red)
                }



    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
