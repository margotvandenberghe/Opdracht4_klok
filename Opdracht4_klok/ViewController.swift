//
//  ViewController.swift
//  Opdracht4_klok
//
//  Created by student on 04/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ClockHelperDelegate, AlarmModelDelegate {
    
    var alarmIsAfgegaanBool: Bool = false
    
    @IBOutlet var wordHet: [UILabel]!
    @IBOutlet var wordIs: [UILabel]!
    
    @IBOutlet var wordVijf: [UILabel]!
    @IBOutlet var wordTien: [UILabel]!
    
    @IBOutlet var wordOver: [UILabel]!
    @IBOutlet var wordVoor: [UILabel]!
    
    @IBOutlet var wordKwart: [UILabel]!
    @IBOutlet var wordHalf: [UILabel]!
    
    //uren
    @IBOutlet var wordEen: [UILabel]!
    @IBOutlet var wordTwee: [UILabel]!
    @IBOutlet var wordDrie: [UILabel]!
    @IBOutlet var wordVier: [UILabel]!
    @IBOutlet var wordVijf2: [UILabel]!
    @IBOutlet var wordZes: [UILabel]!
    @IBOutlet var wordZeven: [UILabel]!
    @IBOutlet var wordAcht: [UILabel]!
    @IBOutlet var wordNegen: [UILabel]!
    @IBOutlet var wordTien2: [UILabel]!
    @IBOutlet var wordElf: [UILabel]!
    @IBOutlet var wordTwaalf: [UILabel]!
    
    @IBOutlet weak var imgClock: UIImageView!
    
    @IBOutlet weak var btnLongPress: UIButton!
    
    var clockhelper: ClockHelper? = nil
    var alarmModel: AlarmModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clockhelper = ClockHelper(delegate: self)
        alarmModel = AlarmModel(delegate: self)
        
        imgClock.isHidden = true
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress))
        btnLongPress.addGestureRecognizer(longGesture)
        
    }
    
    @objc func longPress() {
        
        let alert = UIAlertController(title: "Configuratie", message: "Instellen van wekker", preferredStyle: .alert)
        alert.addTextField{textField in textField.placeholder = "Geef je tijd in als uu:mm bv. 08:30"}
        alert.addAction(UIAlertAction(title: "Annuleer", style: .cancel, handler: {(action: UIAlertAction!) in print("no")} ))
        
        let textField = alert.textFields![0]
        
        alert.addAction(UIAlertAction(title: "Bewaar", style: .default, handler: {(action: UIAlertAction!) in self.checkInputAlarmField(text: textField.text ?? "")} ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkInputAlarmField(text: String) {
        if let a = alarmModel {
            
            let s = a.checkInputFieldAlarm(text)
            switch s {
            case "JUIST":
                imgClock.isHidden = false
                imgClock.backgroundColor = nil
                a.setAlarmTijd(text)
            case "FOUT":
                imgClock.isHidden = false
                imgClock.backgroundColor = UIColor.red
            case "LEEG":
                imgClock.isHidden = true
            default:
                imgClock.isHidden = false
            }
        }
        
    }
    
    func selectWords (arr: Array<String>) {
        for a in arr {
            switch a {
            case "HET":
                setInBlack(coll: wordHet)
            case "IS":
                setInBlack(coll: wordIs)
            case "VIJF":
                setInBlack(coll: wordVijf)
            case "TIEN":
                setInBlack(coll: wordTien)
            case "OVER":
                setInBlack(coll: wordOver)
            case "VOOR":
                setInBlack(coll: wordVoor)
            case "KWART":
                setInBlack(coll: wordKwart)
            case "HALF":
                setInBlack(coll: wordHalf)
            case "EEN":
                setInBlack(coll: wordEen)
            case "TWEE":
                setInBlack(coll: wordTwee)
            case "DRIE":
                setInBlack(coll: wordDrie)
            case "VIER":
                setInBlack(coll: wordVier)
            case "VIJFUUR":
                setInBlack(coll: wordVijf2)
            case "ZES":
                setInBlack(coll: wordZes)
            case "ZEVEN":
                setInBlack(coll: wordZeven)
            case "ACHT":
                setInBlack(coll: wordAcht)
            case "NEGEN":
                setInBlack(coll: wordNegen)
            case "TIENUUR":
                setInBlack(coll: wordTien2)
            case "ELF":
                setInBlack(coll: wordElf)
            case "TWAALF":
                setInBlack(coll: wordTwaalf)
            default:
                break
            }
        }
    }
    
    func setInBlack(coll: [UILabel]) {
        for e in coll {
            e.textColor = UIColor.black
        }
    }
    
    func setAllWhite() {
        setWhite(coll: wordHet)
        setWhite(coll: wordIs)
        setWhite(coll: wordVijf)
        setWhite(coll: wordTien)
        setWhite(coll: wordOver)
        setWhite(coll: wordVoor)
        setWhite(coll: wordKwart)
        setWhite(coll: wordHalf)
        setWhite(coll: wordEen)
        setWhite(coll: wordTwee)
        setWhite(coll: wordDrie)
        setWhite(coll: wordVier)
        setWhite(coll: wordVijf2)
        setWhite(coll: wordZes)
        setWhite(coll: wordZeven)
        setWhite(coll: wordAcht)
        setWhite(coll: wordNegen)
        setWhite(coll: wordTien2)
        setWhite(coll: wordElf)
        setWhite(coll: wordTwaalf)
    }
    
    func setWhite(coll: [UILabel]) {
        for e in coll {
            e.textColor = UIColor.white
        }
    }
    
    func updateClock(_ result: Array<String>){
        setAllWhite()
        if let a = alarmModel {
            if a.getAlarmTijd() != "" {
                checkForAlarm(result)
            }
        }
        selectWords(arr: result)
    }
    
    func checkForAlarm(_ arr: Array<String>) {
        if let a = alarmModel {
            a.checkForAlarm()
        }
    }
    
    func setAlarmOff(_ result: String) {
        if alarmIsAfgegaanBool == false {
            
            let alert = UIAlertController(title: "ALARM", message: "Het is " + result + " !", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
                self.alarmIsAfgegaan()} ))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func alarmIsAfgegaan() {
        alarmIsAfgegaanBool = true
        if let a = alarmModel {
            a.setAlarmTijd("")
        }
        imgClock.isHidden = true
    }
    
}

