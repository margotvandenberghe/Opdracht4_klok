//
//  AlarmModel.swift
//  Opdracht4_klok
//
//  Created by student on 18/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

protocol AlarmModelDelegate {
    
    func setAlarmOff(_ result: String)
    
}

class AlarmModel {
    
    var alarm: String
    let formatter: DateFormatter;
    var delegate: AlarmModelDelegate
    
    init (delegate: AlarmModelDelegate) {
        self.delegate = delegate
        alarm = ""
        formatter = DateFormatter()
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
    
    func setAlarmTijd(_ alarm:String) {
        self.alarm = alarm
    }
    
    func getAlarmTijd() -> String {
        return alarm
    }
    
    func checkInputFieldAlarm(_ alarm: String) -> String {
        if((alarm.range(of: "([0-1][0-9]:[0-6][0-9])", options: .regularExpression) != nil) == true) {
            //string past bij het formaat
            let arr = alarm.split{$0 == ":"}
            let uur = Int(arr[0]) ?? 0
            let min = Int(arr[1]) ?? 0
            
            if ((uur <= 12) && (min <= 60)) {
                //uur is juist, set alarm naar dat uur
                return "JUIST"
            }
            else {
                //uur is niet juist
                return "FOUT"
            }
        }
        else {
            
            if alarm == "" {
                return "LEEG"
            }
            else {
                return "FOUT"
            }
        }
    }
    
    func checkForAlarm() {
        
        let min = getMinutes()
        let uur = getHours()
        
        let arr = alarm.split{$0 == ":"}
        let uurAlarm = Int(arr[0]) ?? 0
        var minAlarm = Int(arr[1]) ?? 0
        
        if (minAlarm % 5) != 0 {
            let r = minAlarm-(minAlarm % 5)
            let s = r/5
            minAlarm = s*5
        }
        
        if min==minAlarm && uur==uurAlarm {
            setAlarmOff()
        }
        
    }
    
    func setAlarmOff() {
        delegate.setAlarmOff(alarm)
    }
}
