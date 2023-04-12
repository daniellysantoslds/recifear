//
//  FirstStepsView.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 03/04/23.
//

import SwiftUI

struct FirstStepsView: View {
    
    @State var showTheExperiences = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Group{
                        Text("Primeiros passos")
                            .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                            .foregroundColor(Color("primary"))
                        
                        Text("O RecifeAR utiliza cartas no mundo real que serão lidas e representadas na tela por objetos 3D.")
                            .font(.custom("ObviouslyVar-Reg", size: 20))
                            .foregroundColor(Color("primary"))
                        
                        Image("montandorecife")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Antes de iniciar, você precisará ter as cartas que vão ser lidas pela câmera em mãos. O arquivo para download está disponível abaixo e você pode imprimir em papel comum.")
                            .font(.custom("ObviouslyVar-Reg", size: 20))
                            .foregroundColor(Color("black"))
                        
                        LargeButton(title: "Baixar cartas para impressão", icon:Image(systemName: "square.and.arrow.down.fill")) {
                            guard let url = URL(string: "https://drive.google.com/drive/folders/13Lo9XL6PUwhBAwiGdfmzldyVw8sLy4ID?usp=sharing") else {
                                return}
                            UIApplication.shared.open(url)}
                    }
                    Group{
                        Image("montandorecife")
                            .resizable()
                            .scaledToFit()
                        
                        Text("A seguir, escolha a experiência que mais se encaixa na sua proposta. Ao tocar nelas, é possível visualizar uma breve descrição.")
                            .font(.custom("ObviouslyVar-Reg", size: 20))
                            .foregroundColor(Color("black"))
                        
                        Image("montandorecife")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Para o primeiro uso, é necessário permitir o acesso à câmera. Depois disso, o app poderá as imagens das cartas e exibir as representações em 3D. Você pode fazer o gesto de pinça com os dedos na tela para aumentar ou diminuir o tamanho da representação.")
                            .font(.custom("ObviouslyVar-Reg", size: 20))
                            .foregroundColor(Color("black"))
                        
                        Image("montandorecife")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Além de alterar o tamanho das representações, é possível visualizar informações sobre cada uma delas. Para isso, basta tocar nela uma vez. O conteúdo nessas informações também pode ser expandido.")
                            .font(.custom("ObviouslyVar-Reg", size: 20))
                            .foregroundColor(Color("black"))
                        
                        Image("montandorecife")
                            .resizable()
                            .scaledToFit()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color("background-1"))
                                .cornerRadius(15)
                                .shadow(radius: 1)
                            VStack(alignment: .leading){
                                Text("Pensamos no RecifeAR como uma ferramenta adaptável para o ensino de diferentes temas. Você pode encontrar algumas sugestões na parte ”As experiências”")
                                    .font(.custom("ObviouslyVar-Reg", size: 20))
                                    .foregroundColor(Color("black"))
                                
                                NavigationLink(destination: TheExperiencesView(), isActive: $showTheExperiences){
                                    LargeButton(title: "Ir para experiências", icon: Image(systemName: "play.fill"), action: {
                                        self.showTheExperiences = true})
                                }

                            }.padding(24)
                        }
                        
                    }
                }.padding(.horizontal, 60)
            }.background(Color(.white))
        }
    }
    
}

struct FirstStepsView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStepsView()
    }
}
