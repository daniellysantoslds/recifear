import Foundation

class BuildingInfoViewModel : ObservableObject {
    @Published var allInfos : [String : BuildingInfoModel] =
    [
            "?" : BuildingInfoModel(
                              bid : "?",
                              title: "?",
                              description: "?",
                              impact: "?",
                              history: "?"),
            "predio1" : BuildingInfoModel(
                              bid : "predio",
                              title: "Edifício",
                              description: "São construções verticais, com vários andares, que abrigam famílias ou empresas em apartamentos.",
                              impact: "Dependendo de como é construído, pode segregar os moradores da rua, limitando a integração social. A concentração de prédios altos também leva a outros problemas, como o aumento da temperatura e a barragem da ventilação da cidade.",
                              history: "O Recife é a terceira capital brasileira com mais prédios de alto gabarito, que são aqueles com mais de 35 metros de altura (ou 12 andares). Essa forma arquitetônica se proliferou na cidade a partir anos 1980, abrigando pessoas das classes média e alta, além de empresariais. Hoje, Recife é a cidade com maior densidade de edificações altas do país."),
            "predio2" : BuildingInfoModel(
                              bid : "predio",
                              title: "Edifício",
                              description: "São construções verticais, com vários andares, que abrigam famílias ou empresas em apartamentos.",
                              impact: "Dependendo de como é construído, pode segregar os moradores da rua, limitando a integração social. A concentração de prédios altos também leva a outros problemas, como o aumento da temperatura e a barragem da ventilação da cidade.",
                              history: "O Recife é a terceira capital brasileira com mais prédios de alto gabarito, que são aqueles com mais de 35 metros de altura (ou 12 andares). Essa forma arquitetônica se proliferou na cidade a partir anos 1980, abrigando pessoas das classes média e alta, além de empresariais. Hoje, Recife é a cidade com maior densidade de edificações altas do país."),
            "barraco" : BuildingInfoModel(
                              bid: "barraco",
                              title: "Barraco",
                              description: "Construções presentes em favelas, tipicamente construídas em alvenaria sem reboco.",
                              impact: "Esse é um dos tipos de habitação mais comuns no Brasil. Em geral, são construídos com pouco planejamento arquitetônico, às vezes em áreas de risco, como regiões de morros em que existe o perigo de deslizamento de terra.s",
                              history: "As favelas são estruturas urbanas de alta densidade populacional caracterizadas por crescimento desordenado. Em geral, situam-se em regiões periféricas de grandes cidades. A Comunidade do Pilar é um exemplo de favela, que, por sua proximidade do Centro do Recife, hoje desperta interesse de investimento do poder público e setores privados"),
            "palafita": BuildingInfoModel(
                              bid: "palafita",
                              title: "Palafita",
                              description: "Habitações sustentadas por estacas às margens de alagados, como rios, lagos, beira-mares.",
                              impact: "Há vários tipos de palafita no mundo todo, com vários graus de segurança. Porém, muitas vezes, elas são construídas sem planejamento. Quando sua estrutura é precária, pode não ter acesso a saneamento básico e correr risco de desabar.",
                              history: "O bairro de Brasília Teimosa era repleto de palafitas em situação precária, até serem removidas em 2003 num processo de requalificação. No Brasil, há vários projetos de habitação popular para tirar pessoas de palafitas, mas muitos deles levam os moradores para áreas bem mais distantes, removendo-os de sua comunidade e seu meios de sobrevivência."),
            "historico1" : BuildingInfoModel(
                              bid: "historico",
                              title: "Histórico",
                              description: "O Centro do Recife apresenta casario com vários tipos de arquitetura, como barroca, eclética e neoclássica.",
                              impact: "Prédios históricos, que revelam o estilo da sua época, são importantíssimos para a preservação da memória de uma cidade. Ao longo de sua existência, o Recife sofreu vários períodos de descaracterização da sua arquitetura.",
                              history: "O Centro expandido do Recife apresenta uma mistura de prédios históricos construídos ao longo dos seus quase 500 anos. São obras principalmente oriundas da colonização portuguesa, da ocupação holandesa e de uma reforma urbana realizada no início do século 20. Hoje, boa parte dessas edificações têm como destinação o uso comercial, e não habitacional."),
            "historico2" : BuildingInfoModel(
                              bid: "historico",
                              title: "Histórico",
                              description: "O Centro do Recife apresenta casario com vários tipos de arquitetura, como barroca, eclética e neoclássica.",
                              impact: "Prédios históricos, que revelam o estilo da sua época, são importantíssimos para a preservação da memória de uma cidade. Ao longo de sua existência, o Recife sofreu vários períodos de descaracterização da sua arquitetura.",
                              history: "O Centro expandido do Recife apresenta uma mistura de prédios históricos construídos ao longo dos seus quase 500 anos. São obras principalmente oriundas da colonização portuguesa, da ocupação holandesa e de uma reforma urbana realizada no início do século 20. Hoje, boa parte dessas edificações têm como destinação o uso comercial, e não habitacional.")
    ]

    

    func selectBuildingInfo(building : String) -> BuildingInfoModel {
        return allInfos[building]!
    }
    
}
