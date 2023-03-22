//
//  ContentView.swift
//  recifear
//
//  Created by aaav on 22/03/23.
//

import SwiftUI
import RealityKit
import ARKit


struct ContentView : View {
    @StateObject var arViewModel : ARViewModel = ARViewModel()
    
    @State private var constructionScale : CGFloat = 1
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            // INSTANCIA A VIEW PASSANDO COMO ARGUMENTO O VIEWMODEL, QUE SERÁ O CONTROLADOR
            ARViewContainer(arViewModel: arViewModel)
            
            VStack{
                Text("Is Image Recognized?")
                // APENAS RECUPERA UMA VARIÁVEL BOOLEANA DO VIEWMODEL PRA DIZER SE JÁ RECONHECEU UMA IMAGEM. SE TRUE, DIZ YEP, SE FALSE, DIZ NOP
                switch arViewModel.imageRecognizedVar{
                case false: Text("Nop").foregroundColor(.red)
                case true: Text("Yep").foregroundColor(.green)
                }
            }.font(.title)
                .padding()
        }
    }
}

// CRIA O VIEW MODEL (QUE CONTROLA O MODEL)
struct ARViewContainer: UIViewRepresentable {
    
    var arViewModel : ARViewModel
    
    // FUNÇÃO PADRÃO DO PROTOCOLO UIVIEWREPRESENTABLE QUE RODA O MÉTODO PRA DAR O DELEGATE PRO VIEWMODEL E RETORNA UMA VIEW (QUE SERÁ COLOCADA NA CONTENT VIEW ASSIM COMO QUALQUER OUTRA VIEW, TIPO UM Text() view, OU UMA Image() view, OU UMA Stack(){}
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    // TENHO QUE VER AINDA COMO USAR ISSO MELHOR
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
