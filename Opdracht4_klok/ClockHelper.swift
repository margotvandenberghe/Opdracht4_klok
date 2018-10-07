//
//  ClockHelper.swift
//  Opdracht4_klok
//
//  Created by Margot Vandenberghe on 07/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class ClockHelper {
    
    let formatter: DateFormatter;
    var currentTime: Array<String> = [] ;
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
    }
    
    func getArrayOfWords() -> Array<String> {
        
        
        return currentTime
    }
    
    func getMinutes() {
        
    }
    
    
}
