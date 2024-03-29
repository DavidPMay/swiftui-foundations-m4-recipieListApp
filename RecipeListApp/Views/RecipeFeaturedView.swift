//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by David May on 10/25/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
  
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
           Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
                .bold()
            
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex){
                    
                    ForEach (0 ..< model.recipes.count, id: \.self) {
                        index in
                        
                        if model.recipes[index].featured {
                            //Recipe card Button
                            Button(action: {
                                
                                
                                //show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                                
                            }, label: {
                                //Recipe Card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Avenir", size: 15))
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipe detail view
                                RecipeDetailView(recipe:
                                                    model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color (.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                        }
                        
                    }
                
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))

                RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
                   
                //Text("Healthy, Hearty")
                
            }
            .padding([.leading, .bottom])
            
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
        
        
       
        
    }
    
    func setFeaturedIndex() {
        // Find index of recipe that is first featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
