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
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 100)
                    
                    CardView(cardImage: cardInfos[0][0], cardText: cardInfos[0][1])
                        .onTapGesture {
                            selectedCard = cardInfos[0][0]
                        }.saturation(selectedCard == "experiencias" ? 1 : 0.6)
                        .scaleEffect(selectedCard == "experiencias" ? 1 : 0.97)
                        .animation(.spring(), value: selectedCard)
                    
                    CardView(cardImage: cardInfos[1][0], cardText: cardInfos[1][1])
                        .onTapGesture {
                            selectedCard = cardInfos[1][0]
                        }.saturation(selectedCard == "experiencias" ? 0.6 : 1)
                        .scaleEffect(selectedCard == "experiencias" ? 0.97 : 1)
                        .animation(.spring(), value: selectedCard)
                    
//                    ForEach(cardInfos, id: \.self) { cardInfo in
//                        CardView(cardImage: cardInfo[0], cardText: cardInfo[1])
//                            .onTapGesture {
//                                selectedCard = cardInfo[0]
//                            }
//                    }.listStyle(SidebarListStyle())
                    
                    Spacer()
                }
                .background(
                    Rectangle()
                        .fill(.white)
                        .ignoresSafeArea()
                )
                .padding(.horizontal, 24)
                .frame(width: UIScreen.main.bounds.width * 0.27)

                
                ZStack{
                    Color("background").ignoresSafeArea()
                    
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
    @State var showBuildingRecife = false
    
    var body : some View {
        
        VStack{
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 16) {
                    Text("Experiências")
                        .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                        .foregroundColor(Color("primary"))
                    
                    Text("Navegue por algumas de nossas experiências em Realidade Aumentada com temática urbanística")
                        .font(.custom("ObviouslyVar-Reg", size: 20))
                        .foregroundColor(Color("primary"))
                }
                
                NavigationLink(destination: DescriptionView(), isActive: $showBuildingRecife) {
                    Image("montandorecife")
                        .resizable()
                        .scaledToFit()
                }
            }.padding(.horizontal, 36)
            Spacer()
        }.padding(.top, 84)
    }
}


struct HowToUseView : View {
    
    let howToCardInfos = ["experience", "experience", "experience", "experience"]
    
    var body : some View {
        VStack{
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 16) {
                    Text("Como usar o app")
                        .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                        .foregroundColor(Color("primary"))
                    
                    Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades.")
                        .font(.custom("ObviouslyVar-Reg", size: 20))
                        .foregroundColor(Color("primary"))
                }
                
                VStack(spacing: 30){
                    HStack(spacing: 44){
                        NavigationLink(destination: FirstStepsView()) {
                            Image(howToCardInfos[0])
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: TheExperiencesView()){
                            Image(howToCardInfos[1])
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    HStack(spacing: 44){
                        
                        NavigationLink(destination: AboutUsView()){
                            Image(howToCardInfos[3])
                                .resizable()
                                .scaledToFit()
                        }
                        Rectangle()
                            .frame(height: 0)
                        
                        
                    }
                }
            }
            .padding(.horizontal, 36)
            
            Spacer()
            
        }.padding(.top, 84)
    }
}

struct DescriptionView : View {
    @State var showExperience = false
    var body: some View {
        NavigationView{
            HStack{
                VStack{
                    VStack(alignment: .leading){
                        Text("Montando Recife")
                            .font(.custom("ObviouslyVar-WideSmBd", size: 40))
                            .foregroundColor(Color("primary"))
                        
                        
                        Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades.").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("primary"))
                            .padding(.vertical, 16)
                    }
                    Spacer()
                    NavigationLink(destination: Text("OI!"), isActive: $showExperience){
                        LargeButton(title: "Começar Experiência", icon: Image(systemName:"play.fill"), action: {
                            self.showExperience = true
                        })
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width * 0.35)
                .padding(.vertical, 71)
                .padding(.horizontal, 36)
                .background(
                    Rectangle()
                        .fill(.white)
                        .ignoresSafeArea()
                )
                
                Spacer()
            }.background(
                Image("experienciarecife")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            )
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CardView: View {
    let cardImage: String
    let cardText: String
    
    var body: some View {
        VStack(alignment: .leading){
            Image(cardImage)
                .resizable()
                .scaledToFit()
            
            Text(cardText).font(.custom("ObviouslyVar-SmBd", size: 16)).foregroundColor(Color("primary-lighter"))
                .padding(.leading, 10)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}

