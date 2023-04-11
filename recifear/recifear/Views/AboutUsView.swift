//
//  AboutUsView.swift
//  recifear
//
//  Created by sofia.ribeiro on 05/04/23.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    
                    Text("Sobre nós")
                        .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                        .foregroundColor(Color("primary"))
                    
                    Text("O Time")
                        .font(.custom("ObviouslyVar-Reg", size: 24))
                        .foregroundColor(Color("primary"))
                    
                    Text("Este aplicativo foi criado durante um desafio da turma 22/23 da Apple Developer Academy @UFPE. O time foi composto por André Valença, Danielly Santos, Natália Oliveira, Ryan Araújo e Sofia Ribeiro. Juntos, desenvolvemos o Recife AR, um aplicativo educacional que utiliza a tecnologia de Realidade Aumentada para proporcionar uma experiência única e interativa aos usuários.")
                        .font(.custom("ObviouslyVar-Reg", size: 20))
                        .foregroundColor(Color("black"))
                    
                    
                    Text("A Motivação")
                        .font(.custom("ObviouslyVar-Reg", size: 24))
                        .foregroundColor(Color("primary"))
                    
                    Text("Durante o nosso processo de desenvolvimento, fomos desafiados a criar uma solução inovadora para o tema de justiça social e educação, e decidimos focar na cidade do Recife e suas diferentes habitações. Nosso objetivo principal era criar uma experiência única que pudesse abordar todos esses pontos de forma integrada.")
                        .font(.custom("ObviouslyVar-Reg", size: 24))
                        .foregroundColor(Color("black"))
                    
                }.padding(.horizontal, 60)
            }
        }
    }
}


struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
