//
//  ContentView.swift
//  RecipeListApp
//
//  Created by David May on 10/2/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the ViewModel
    //@ObservedObject var model = RecipeModel()
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                   
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .bold()
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                                
                                // MARK: Row item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack(alignment:.leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))

                                            .bold()
                                        RecipeHighlightsView(highlights: r.highlights)
                                            .foregroundColor(.black)
                                           
                                    }
                                    
                                }
                            })
                        }
                        .navigationBarHidden(true)
                    }
                   
                }
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
