//
//  AlbumListViewModel.swift
//  itunesSearchApp
//
//  Created by Nitin Singh Manhas on 06/04/24.
//

import Foundation
import Combine


class AlbumListViewModel : ObservableObject{
    @Published var searchTerm: String = ""
    @Published var albums:[Album] = [Album]()
    
    let limit : Int = 20
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        $searchTerm
            .dropFirst()
            .sink{ [weak self] term in
            self?.fetchAlbum(for: term)
            
        } .store(in: &subscriptions)
    }
    
    func fetchAlbum(for searchTerm:String){
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&\(limit)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            if let error = error{
                print("urlsession error: \(error.localizedDescription)")
            } else if let data = data {
                do{
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async{
                        self.albums = result.results
                    }
                }
                catch{
                    print("decoding error \(error)")
                }
            }
            
        } .resume()
    }
}
