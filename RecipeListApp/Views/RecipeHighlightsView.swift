//
//  RecipeHighlightsView.swift
//  RecipeListApp
//
//  Created by David May on 2/19/23.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var allHighlights = ""
    init(highlights:[String]) {
        // Loop through the highlights and build the string
        for index in 0..<highlights.count{
            
            // If this is the last item, don't add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["Test","Test2"])
    }
}
