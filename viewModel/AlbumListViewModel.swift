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
    
    @Published var isLoading : Bool = false
    
    let limit : Int = 20
    var page : Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        $searchTerm
            .dropFirst()
            .sink{ [weak self] term in
                self?.albums = []
            self?.fetchAlbum(for: term)
            
        } .store(in: &subscriptions)
    }
    
    func loadMore(){
        fetchAlbum(for: searchTerm)
    }
    
    
    func fetchAlbum(for searchTerm:String){
        
        guard !searchTerm.isEmpty else{
            return
        }
        
        guard !isLoading else{
            return
        }
        
        let offset = page * limit
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&\(limit)&offset\(offset)") else {
            return
        }
        
        print("start fetching data from \(searchTerm)")
        
        isLoading = true
        
        URLSession.shared.dataTask(with: url){ [weak self] data,response,error in
            
            if let error = error{
                print("urlsession error: \(error.localizedDescription)")
            } else if let data = data {
                do{
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async{
                        for album in result.results {
                            self?.albums.append(album)
                        }
                        self?.page += 1
                    }
                }
                catch{
                    print("decoding error \(error)")
                }
            }
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
        } .resume()
    }
}
