//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by David May on 10/6/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipie Title
                
                Text(recipe.name)
                   
                    .padding(.top, 20)
                    .padding(.leading, 5)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .bold()
                
                // MARK: Serving Size Picker
                
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    .font(Font.custom("Avenir", size: 15))
                }
                .padding(10)
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.vertical, 5)
                    
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " +  RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                            

                    
                }
                .padding(.horizontal, 10)
                
                // MARK: Divider
                
                Divider()

                // MARK: Directions
                
                VStack(alignment: .leading)  {
                    
                    Text("Directions")
                        .padding(.vertical, 5)
                        .font(Font.custom("Avenir Heavy", size: 16))
                       
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))

                    }
                    
                   // .padding(.bottom, 2)
                    
                }
                .padding(.horizontal, 10.0)
                
                
            }
        }
        //.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummhy recipe and pass it into the detail view so we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
