//
//  MenuView.swift
//  recifear
//
//  Created by sofia.ribeiro on 28/03/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var selectedCard : String = "experiencias"
    
    
    let cardInfos = [
        ["experiencias", "Experiências"],
        ["comousar", "Como usar o app"]
    ]
    
    var body: some View {
        NavigationStack {
            HStack{
                VStack(spacing: 36){
                    ForEach(cardInfos, id: \.self) { cardInfo in
                        CardView(cardImage: cardInfo[0], cardText: cardInfo[1])
                            .onTapGesture {
                                selectedCard = cardInfo[0]
                            }
                        
                    }.listStyle(SidebarListStyle())
                }.frame(maxWidth: 306)
                
                ZStack{
                    Color(red: 255/255, green: 250/255, blue: 248/255).ignoresSafeArea()
                    
                    if selectedCard == "experiencias"{
                        ExperienceView()
                    } else{
                        HowToUseView()
                    }
                    
                }
            }
        }
    }
}


struct ExperienceView : View {
    let longCardInfos = [
        ["montandorecife", "Montando Recife", "Crie o Recife dos seus sonhos"]
    ]
    
    @State var showBuildingRecife = false
    
    var body : some View {
        VStack(alignment: .leading, spacing: 36) {
            Text("Experiências")
                .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                .foregroundColor(Color("primary"))
            //                .padding(.top, 60)
            //                .padding(.bottom, 30)
            
            
            VStack {
                NavigationLink(destination: DescriptionView(), isActive: $showBuildingRecife) {
                    LongCardView(longCardImage: longCardInfos[0][0], longTitle: longCardInfos[0][1], longSubtitle: longCardInfos[0][2])
                }
                
                
                
                
            }
        }.padding(.top, -350)
    }
}


struct HowToUseView : View {
    
    let howToCardInfos = ["experience", "experience", "experience", "experience"]
    
    var body : some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 16) {
                Text("Como usar o app")
                    .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                    .foregroundColor(Color("primary"))
                
                Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades")
                    .font(.custom("ObviouslyVar-Reg", size: 20))
                    .foregroundColor(Color("primary"))
            }
            
            VStack(spacing: 30){
                HStack{
                    NavigationLink(destination: FirstStepsView()) {
                        Image(howToCardInfos[0])
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 343, minHeight: 168)
                    }
                    NavigationLink(destination: TheExperiencesView()){
                        Image(howToCardInfos[1])
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 343, minHeight: 168)
                    }
                }
                
                HStack(spacing: 44){
                    NavigationLink(destination: AugmentedRealityView()){
                        Image(howToCardInfos[2])
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 343, minHeight: 168)
                    }
                    
                    NavigationLink(destination: AboutUsView()){
                        Image(howToCardInfos[3])
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 343, minHeight: 168)
                    }
                    
                }
            }
        }
        .padding(.leading, 36)
        .padding(.trailing, 36)
    }
}

struct DescriptionView : View {
    @State var showExperience = false
    var body: some View {
        NavigationStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Montando Recife").font(.custom("ObviouslyVar-WideSmBd", size: 40)).foregroundColor(Color("primary"))
                    
                    
                    Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("primary")).padding(.vertical, 16)
                    
                    
                    NavigationLink(destination: Text("OI"), isActive: $showExperience){
                        
                        LargeButton(title: "Começar Experiência", icon: Image(systemName:"play.fill"), action: {
                            self.showExperience = true
                            
                        }
                                    
                        )
                        
                        
                    }
                    
                }.padding(.top, -300)
                    .padding(.leading, 60)
                    .padding(.trailing, 60)
                
                Image("experienciarecife")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 677, height: 720)
                    .scaledToFill()
            }
        }
    }
}

struct CardView: View {
    let cardImage: String
    let cardText: String
    
    var body: some View {
        VStack(alignment: .leading){
            Image(cardImage)
                .resizable()
                .frame(width: 258, height: 142)
            
            Text(cardText).font(.custom("ObviouslyVar-SmBd", size: 16)).foregroundColor(Color("primary-lighter"))
        }
    }
}

struct LongCardView: View {
    let longCardImage: String
    let longTitle: String
    let longSubtitle: String
    
    var body: some View {
        ZStack(alignment: .leading ) {
            Image(longCardImage)
                .resizable()
                .frame(width: 737, height: 246)
            
            VStack(alignment: .leading){
                Text(longTitle).font(.custom("ObviouslyVar-WideSmBd", size: 24)).foregroundColor(Color("background"))
                Text(longSubtitle).font(.custom("ObviouslyVar-Reg", size: 15)).foregroundColor(Color("background"))
            }.padding(.leading, 24)
                .padding(.top, 160)
            
        }.padding(.top, 20)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}

