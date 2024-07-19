//
//  ViewController.swift
//  TicTacToe
//
//  Created by SHREYASH GUPTA on 19/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum Turn{
        case Nought
        case Cross
    }
    
    @IBOutlet weak var turnLbl: UILabel!
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func boardBtnClicked(_ sender: UIButton) {
        addToBoard(sender)
    }
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Nought){
                
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLbl.text = CROSS
            }
            else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLbl.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

