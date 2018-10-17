//
//  ClockHelper.swift
//  Opdracht4_klok
//
//  Created by Margot Vandenberghe on 07/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

protocol ClockHelperDelegate {
    
    func updateClock(_ result: Array<String>)
    
}

class ClockHelper {
    
    var delegate: ClockHelperDelegate
    let formatter: DateFormatter;
    var currentTime: Array<String> = [] ;
    
    var timer = Timer()
    
    init(delegate: ClockHelperDelegate) {
        self.delegate = delegate
        formatter = DateFormatter()
        setTimer()
    }
    
    func setTimer() {
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) {
                (timer) in  self.updateClock(timer)
            }
        } else {
            timer = Timer()
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
            break
        default:
            break
        }
        
    }
    
    func getArrayOfWordsHours() {
        if getMinutes() < 30
        {
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
        else {
            switch getHours() {
            case 1:
                currentTime.append("TWEE")
            case 2:
                currentTime.append("DRIE")
            case 3:
                currentTime.append("VIER")
            case 4:
                currentTime.append("VIJFUUR")
            case 5:
                currentTime.append("ZES")
            case 6:
                currentTime.append("ZEVEN")
            case 7:
                currentTime.append("ACHT")
            case 8:
                currentTime.append("NEGEN")
            case 9:
                currentTime.append("TIENUUR")
            case 10:
                currentTime.append("ELF")
            case 11:
                currentTime.append("TWAALF")
            case 12:
                currentTime.append("EEN")
            default:
                break
            }
        }
//        if getMinutes() == 0 {
//            currentTime.append("UUR")
//        }
    }
    
    func sendArray() -> Array<String> {
        currentTime.append("HET")
        currentTime.append("IS")
        
        getArrayOfWordsMinutes()
        getArrayOfWordsHours()
        
        let help = currentTime
        currentTime.removeAll()
        
        return help
    }
    
    func updateClock(_ timer: Timer) {
        delegate.updateClock(sendArray())
    }
    
    
}


