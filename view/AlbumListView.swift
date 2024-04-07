//
//  AlbumListView.swift
//  itunesSearchApp
//
//  Created by Nitin Singh Manhas on 06/04/24.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var ViewModel = AlbumListViewModel()
    var body: some View {
        NavigationView{
            List{
                
                ForEach(ViewModel.albums){ album in
                    Text(album.collectionName)
                    
                }
                
                if ViewModel.isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                } else{
                    Color.clear
                        .onAppear{
                            ViewModel.loadMore()
                        }
                }
            }
            
            .listStyle(.plain)
            .searchable(text: $ViewModel.searchTerm)
            .navigationTitle("search")
        }
        
    }
}

#Preview {
    AlbumListView()
}
