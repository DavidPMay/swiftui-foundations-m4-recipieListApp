//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by David May on 10/6/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    
                    ForEach (recipe.ingredients, id: \.self) { ingredient in
                        Text("• " + ingredient)
                    }
                    
                }
                .padding(.horizontal, 10)
                
                // MARK: Divider
                
                Divider()

                // MARK: Directions
                
                VStack(alignment: .leading)  {
                    
                    Text("Directions")
                        .padding(.vertical, 5)
                        .font(.headline)
                       
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                    
                   // .padding(.bottom, 2)
                    
                }
                .padding(.horizontal, 10.0)
                
                
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummhy recipe and pass it into the detail view so we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
