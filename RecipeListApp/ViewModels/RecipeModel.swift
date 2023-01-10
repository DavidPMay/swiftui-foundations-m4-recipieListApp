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
    
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
           
            // Get a single serving size by multiplying the denominator by the recipie servings
            
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            
            numerator *= targetServings
            
            // Reduce fraction by greatest common devisor
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get whole portion if numerator is greater than denominator
            
            if numerator >= denominator {
                
                // calculate the whole portions
                
                wholePortions = numerator / denominator
                
                
                // calculate the remainder
                numerator = numerator % denominator
                
                // assign to portion string
                
                portion += (String(wholePortions) + " ")
             
                
            }
            
            // Get remainder portion and express as a fraction
            
            if numerator > 0 {
                
                // assign the remainder as fraction to the portion string
                
                //portion += wholePortions > 0 ? " " : ""
                
                portion += String(numerator)
                portion += "/"
                portion += (String(denominator) + " ")
                
            }
        }
        
        if var unit = ingredient.unit {
            
       
            
            // check if we need to pleuralize
            if (wholePortions == 1 && numerator > 0)  ||  wholePortions > 1  {
                
                if unit.suffix(2) == "ch" {
                    
                    unit += "es"
                    
                } else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                } else {
                    
                    unit += "s"
                    
                }
            }
                
            
            
            // calculate appropiate unit
            return portion + unit
            
        }
        
        return portion 
    }
}
