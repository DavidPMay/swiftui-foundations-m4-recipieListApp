//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by David May on 10/22/22.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        TabView{
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
   
    static var previews: some View {
        RecipeTabView()
            .environmentObject(RecipeModel())
    }
}
