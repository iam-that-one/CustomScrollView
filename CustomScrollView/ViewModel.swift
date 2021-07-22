//
//  ViewModel.swift
//  CustomScrollView
//
//  Created by Abdullah Alnutayfi on 22/07/2021.
//

import Foundation
import SwiftUI
class ViewModel : ObservableObject{
    @Published  var selected : UUID?
    @Published var places = [Place]()
    
    func detData(){
    places =  [
            Place(id: UUID(), image: "n1", title: "Tree Sunrisen", description: """
                Photo by Phil~Koch on flickr · · · Explore Phil~Koch's photos on Flickr. Phil~Koch has uploaded 2738 photos to Flickr.
                
                """),
            Place(id: UUID(), image: "n2", title: """
Photo by Phil~Koch on flickr · · · Explore Phil~Koch's photos on Flickr. Phil~Koch has uploaded 2738 photos to Flickr.
""", description: """
Explore the most popular trails in Hayes Nature Park with hand-curated trail maps and driving directions as well as detailed reviews and photos from hikers, campers and nature lovers like you.
"""),
            Place(id: UUID(), image: "n3", title: " BEAUTIFUL NATURE", description: "MOBILE WALLPAPERS FOR ALL 480×800 PIXEL SMART PHONE"),
            Place(id: UUID(), image: "n4", title: " pleasant wallpapers for mobile", description: "pleasant wallpapers for mobile,water,nature,green,light,night"),
            Place(id: UUID(), image: "n5", title: "Stand-up Paddle Boarding", description: """
We’re thrilled to be working with the Niagara Peninsula Conservation Area to provide SUP adventures and lessons at Chippawa Creek Conservation Area this summer.
"""),
            Place(id: UUID(), image: "n8", title: "Nature Wallpapers HD", description: "Nature Wallpapers HD"),
            Place(id: UUID(), image: "n7", title: "Tree Sunrisen", description:  """
                Photo by Phil~Koch on flickr · · · Explore Phil~Koch's photos on Flickr. Phil~Koch has uploaded 2738 photos to Flickr.
                
                """)
        ]
       selected = places[0].id
   
    }
    
    func selectedFact(id: UUID?) -> Place? {
        return places.first(where: {$0.id == id})
    }
}


struct Place : Identifiable {
    var id = UUID()
    var image = ""
    var title = ""
    var description = ""
}
