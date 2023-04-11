//
//  DownloadView.swift
//  recifear
//
//  Created by sofia.ribeiro on 11/04/23.
//

import SwiftUI

struct DownloadView: View {
    
    @State private var image: UIImage? = nil
    @State private var isDownloaded = false
    
    let imageURL = URL(string: "https://example.com/image.jpg")!
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
            Button(action: {
                downloadImage()
            }, label: {
                if isDownloaded {
                    Text("Salvar imagem")
                } else {
                    Text("Baixar imagem")
                }
            })
            .disabled(image == nil)
        }
    }
    
    func downloadImage() {
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                image = UIImage(data: data)
                isDownloaded = true
            }
        }
        task.resume()
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
    }
}
