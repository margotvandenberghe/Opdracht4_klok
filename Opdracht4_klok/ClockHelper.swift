//
//  ClockHelper.swift
//  Opdracht4_klok
//
//  Created by Margot Vandenberghe on 07/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class ClockHelper : IntClockHelp {
    
    var timer: Timer
    
    let formatter: DateFormatter;
    var currentTime: Array<String> = [] ;
    
    init() {
        formatter = DateFormatter()
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 300, repeats: true) {
                (timer) in self.sendArray(timer: timer)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func getHours () -> Int {
        formatter.dateFormat = "HH"
        let hourString = formatter.string(from: Date())
        return Int(hourString) ?? 0
    }
    
    func getMinutes () -> Int {
        formatter.dateFormat = "mm"
        let minutesString = formatter.string(from: Date())
        var test = Int(minutesString) ?? 0
        if (test % 5) != 0 {
            let r = test-(test % 5)
            let s = r/5
            test = s*5
        }
        return test
    }
    
    func getArrayOfWordsMinutes(){
       switch getMinutes() {
        case 5:
            currentTime.append("VIJF")
            currentTime.append("OVER")
        case 10:
            currentTime.append("TIEN")
            currentTime.append("OVER")
        case 15:
            currentTime.append("KWART")
            currentTime.append("OVER")
        case 20:
            currentTime.append("TIEN")
            currentTime.append("VOOR")
            currentTime.append("HALF")
        case 25:
            currentTime.append("VIJF")
            currentTime.append("VOOR")
            currentTime.append("HALF")
        case 30:
            currentTime.append("HALF")
        case 35:
            currentTime.append("VIJF")
            currentTime.append("OVER")
            currentTime.append("HALF")
        case 40:
            currentTime.append("TIEN")
            currentTime.append("OVER")
            currentTime.append("HALF")
        case 45:
            currentTime.append("KWART")
            currentTime.append("VOOR")
        case 50:
            currentTime.append("TIEN")
            currentTime.append("VOOR")
        case 55:
            currentTime.append("VIJF")
            currentTime.append("VOOR")
        case 0:
            print(0)
        default:
            break
        }
        
    }

    func getArrayOfWordsHours() {
        
        switch getHours() {
        case 1:
            currentTime.append("EEN")
        case 2:
            currentTime.append("TWEE")
        case 3:
            currentTime.append("DRIE")
        case 4:
            currentTime.append("VIER")
        case 5:
            currentTime.append("VIJFUUR")
        case 6:
            currentTime.append("ZES")
        case 7:
            currentTime.append("ZEVEN")
        case 8:
            currentTime.append("ACHT")
        case 9:
            currentTime.append("NEGEN")
        case 10:
            currentTime.append("TIENUUR")
        case 11:
            currentTime.append("ELF")
        case 12:
            currentTime.append("TWAALF")
        default:
            break
        }
    }

    func sendArray(timer: Timer) -> Array<String> {
        currentTime.append("HET")
        currentTime.append("IS")
        
        getArrayOfWordsMinutes()
        getArrayOfWordsHours()
        
        let help = currentTime
        currentTime.removeAll()
        
        return help
    }
    
    
    
}

protocol IntClockHelp {
    
    var timer: Timer { get set }
    
    func sendArray(timer: Timer) -> Array<String>
}
