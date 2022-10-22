//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by David May on 10/2/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
   @Published var recipes = [Recipe]()
    
    init() {
        
        
        // create an instance of DataService and get the data
        
//        let service = DataService()
//
//        self.recipes = service.getLocalData()
        
        // could also write
   //     self.recipes = DataService().getLocalData()
        
        // by making the DataService method static we create a 'type' method and can write the code like this
        
        self.recipes = DataService.getLocalData()
        
        
        // Set the recipies property
        
        
        
    }
    
    
}
