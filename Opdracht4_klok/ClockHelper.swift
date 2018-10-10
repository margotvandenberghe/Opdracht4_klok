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
    }
    
    func getHours () -> String {
        formatter.dateFormat = "HH"
        let hourString = formatter.string(from: Date())
        return hourString
    }
    
    func getMinutes () -> String {
        formatter.dateFormat = "mm"
        var minutesString = formatter.string(from: Date())
        let test = Int(minutesString) ?? 0
        if (test % 5) != 0 {
            let r = test-(test % 5)
            let s = r/5
            minutesString = String(s*5)
        }
        return minutesString
    }
    
    func getArrayOfWords() -> Array<String> {
        
        
        return currentTime
    }

    
    
    
}

