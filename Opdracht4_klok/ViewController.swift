//
//  ViewController.swift
//  Opdracht4_klok
//
//  Created by student on 04/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IntClockHelp {
    
    var timer = Timer()
    
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
    
    let clockhelper = ClockHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sendArray(timer: timer)
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
    
    func sendArray(timer: Timer) -> Array<String> {
        selectWords(arr: clockhelper.sendArray(timer: timer))
        return clockhelper.sendArray(timer: timer)
    }
}

