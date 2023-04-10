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
                VStack(alignment: .leading) {
                    
                    // Spacer(minLength: 700)
                    
                    Text("Primeiros passos")
                    Text("O RecifeAR utiliza cartas no mundo real que serão lidas e representadas na tela por objetos 3D")
                    
                    Text("O RecifeAR utiliza cartas no mundo real que serão lidas e representadas na tela por objetos 3D")
                    
                    Group {
                        Image("montandorecife")
                            .resizable()
                            .frame(width: 737, height: 209)
                        
                        Text("Antes de iniciar, você precisará ter as cartas que vão ser lidas pela câmera em mãos. O arquivo para download está disponível abaixo e você pode imprimir em papel comum.")
                    }
                    
                    
                    Group {
                        LargeButton(title: "Baixar cartas para impressão", icon:Image(systemName: "square.and.arrow.down.fill")) {
                            print("vai baixar")
                        }
                        
                        Image("montandorecife")
                            .resizable()
                            .frame(width: 737, height: 209)
                        
                        
                        Text("A seguir, escolha a experiência que mais se encaixa na sua proposta. Ao tocar nelas, é possível visualizar uma breve descrição.")
                    }
                    
                    Group {
                        Image("montandorecife")
                            .resizable()
                            .frame(width: 737, height: 209)
                        
                        Text("Para o primeiro uso, é necessário permitir o acesso à câmera. Depois disso, o app poderá as imagens das cartas e exibir as representações em 3D. Você pode fazer o gesto de pinça com os dedos na tela para aumentar ou diminuir o tamanho da representação.")
                        
                        Image("montandorecife")
                            .resizable()
                            .frame(width: 737, height: 209)
                    }
                    
                    Group {
                        Text("Além de alterar o tamanho das representações, é possível visualizar informações sobre cada uma delas. Para isso, basta tocar nela uma vez. O conteúdo nessas informações também pode ser expandido.")
                        
                        
                        Image("montandorecife")
                            .resizable()
                            .frame(width: 737, height: 209)
                    }
                    
                    ZStack {
                        VStack {
                            Text("Pensamos no RecifeAR como uma ferramenta adaptável para o ensino de diferentes temas. Você pode encontrar algumas sugestões na parte ”As experiências”")
                            
                            NavigationLink(destination: TheExperiencesView(), isActive: $showTheExperiences){
                                LargeButton(title: "Ir para experiências", icon: Image(systemName: "play.fill"), action: {
                                    self.showTheExperiences = true
                                    
                                })
                                
                            }
                            
                            
                        }
                        .frame(width: 737, height: 195).background(Color("background-1"))
                        .cornerRadius(14)
                        .border(Color("stroker"))
                        
                        
                        
                        
                    }
                }
            }
        }
    }
    
}

struct FirstStepsView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStepsView()
    }
}
