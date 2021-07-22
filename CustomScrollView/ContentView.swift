//
//  ContentView.swift
//  CustomScrollView
//
//  Created by Abdullah Alnutayfi on 22/07/2021.
//

import SwiftUI
import CollectionViewPagingLayout
struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var options : ScaleTransformViewOptions{
        .layout(.coverFlow)
    }
    var body: some View {
        ZStack{
            Color.black
        VStack{
            Spacer()
            ScalePageView(viewModel.places,selection: $viewModel.selected){ place in
                Image(place.image)
                    .resizable()
                    .frame(width: 300, height: 500)
                    .cornerRadius(10)
                    .shadow(color: .white,radius: 5)
                    .offset(y:20)
            }
            .options(options)
            .pagePadding(
                vertical: .absolute(100), horizontal: .absolute(80)
            )
            if viewModel.selected != nil{
               
                DetailView(id: viewModel.selected, viewModel: viewModel)
                    .frame(width: 300, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.offset(y:40)
                
            }
        }.onAppear{viewModel.detData()}
        
      
        }  .ignoresSafeArea()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView: View {
    let id: UUID?
    var viewModel:ViewModel
    var body: some View {
            VStack {
                
                Text(viewModel.selectedFact(id: id)?.title ?? "")
                    .font(.title)
                Text(viewModel.selectedFact(id: id)?.description ?? "")
                Spacer()
            }.foregroundColor(.white)
            .animation(.easeIn)
            .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        DetailView(id: viewModel.places[0].id, viewModel: viewModel)
    }
}
