//
//  DataService.swift
//  RecipeListApp
//
//  Created by David May on 10/2/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathName is not nil otherwise
        
        guard pathString != nil else {
            
            return [Recipe]()
        }
        
        
        // Create a URL object
        
        //let url = URL(fileURLWithPath: pathString!)
        let url = URL(filePath: pathString!)
        
        do {
            // Create a Data object
            
            let data = try Data(contentsOf: url)
            
            // Decode the object with a JSON decoder
            let decoder = JSONDecoder()
            
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the Unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    
                    // Add unique ID to ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
                
            }
            catch {
                
                // Error with parsing json
                print(error)
                
            }
           
            
            
            
        }
        catch {
            
            // Error with getting data
            print(error)
            
        }
        
        return [Recipe]()
    }
}
