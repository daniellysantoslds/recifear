//
//  ARModel.swift
//  recifear
//
//  Created by aaav on 22/03/23.
//

import Foundation
import RealityKit
import ARKit

struct ARModel{
    private(set) var arView : ARView
    
    private let size : Float = 0.0015
    
    private var models3D : [String : Model3D] = {
        let filemanager = FileManager.default
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else { return [:] }
        
        var availableModels : [String : Model3D] = [:]
        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model3D = Model3D(modelName: modelName)
            availableModels[filename] = model3D
        }
        
        return availableModels

    }()
    
    // INICIALIZA O MODEL, ASSIM QUE INSTANCIADO
    init() {
        
        arView = ARView(frame: .zero)
        
        // PEGA TODAS AS IMAGENS DAS PASTA RESOURCES QUE SERVIRÃO DE ÂNCORA
        guard let trackerImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = trackerImages
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            configuration.sceneReconstruction = .mesh
        }
        
        configuration.maximumNumberOfTrackedImages = 0
        
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    
    func resetSession(){
        Settings.shared.created = false

        guard let trackerImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }


        arView.session.pause()
        
        for anchor in arView.scene.anchors {
            arView.scene.removeAnchor(anchor)
        }

        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = trackerImages
        configuration.maximumNumberOfTrackedImages = 0
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    // ENCONTRA AS IMAGENS NA CÂMERA
    mutating func imageRecognized(anchors: [ARAnchor]) {
        
        // PEGA TODAS AS IMAGENS DA CENA E ANCORA NUM LUGAR
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // PEGA AS ÂNCORAS (TIPO AS COORDENADAS)
        for anchor in anchors {
                guard let imageAnchor = anchor as? ARImageAnchor else { return }
//                var modelEntity = ModelEntity()

                let position = imageAnchor.transform
            
                // CRIA O OBJETO 3D, e remove o número final da imagem pra chamar o model

                let justCreated = String(imageAnchor.name!.dropLast()) + ".usdz"
            
            
                let modelEntity = models3D[justCreated]?.modelEntity
                
//                let modelEntity = try! ModelEntity.loadModel(named: justCreated)
            
                modelEntity!.name = imageAnchor.name!
            
                // COLOCA O OBJETO EM CIMA DA ÂNCORA
                placeConstruction(construction: modelEntity!, imageAnchor: position)
        }
    }

    // COLOCA O OBJETO EM CIMA DA ÂNCORA
    mutating func placeConstruction(construction: ModelEntity, imageAnchor: float4x4){

        let imageAnchorEntity = AnchorEntity(world: imageAnchor)

        // PODE MEXER NA ESCALA DO OBJETO 3D
        construction.transform.scale = SIMD3<Float>(0.0015, 0.0015, 0.0015)

        // SITUA O OBJETO 3D NO ESPAÇO EM RELAÇÃO À ÂNCORA
//        construction.setPosition(SIMD3(x: 0, y: 0, z: 0), relativeTo: imageAnchorEntity)

        // INSTALA POSSIBILIDADE DE MUDAR O TAMANHO E ROTACIONAR
        construction.generateCollisionShapes(recursive: true)
        arView.installGestures([.scale, .rotation], for: construction)
            .forEach{ gestureRecognizer in
                gestureRecognizer.addTarget(self.arView, action: #selector(arView.capScale(_:)))
            }
        
        // FUNÇÕES QUE ADICIONAM DE FATO NA CENA
        imageAnchorEntity.addChild(construction)
        arView.scene.addAnchor(imageAnchorEntity)
    
        Settings.shared.created = true
    }
    
}


extension ARView {
    func enableFindOutMore(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        if let entity = self.entity(at: tapLocation) as? ModelEntity{
            
            Settings.shared.currentConstruction = String(entity.name.dropLast())
            
            if Settings.shared.opened == false {
                Settings.shared.opened.toggle()
            }
        }
    }
    
    func enableScaleCap(){
        let scaleGestureRecognizer = EntityScaleGestureRecognizer(target: self, action: #selector(capScale(_:)))
    }
    
    @objc func capScale(_ recognizer: EntityScaleGestureRecognizer){
        if (recognizer.entity?.scale.x)! > 0.003 {
            recognizer.entity?.transform.scale = SIMD3<Float>(0.003, 0.003, 0.003)
        }
        if (recognizer.entity?.scale.x)! < 0.001 {
            recognizer.entity?.transform.scale = SIMD3<Float>(0.001, 0.001, 0.001)
        }
    }
}
