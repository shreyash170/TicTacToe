//
//  ViewController.swift
//  TicTacToe
//
//  Created by SHREYASH GUPTA on 19/07/24.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
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
    var board = [UIButton]()
    var noughtsScore = 0
    var crossesScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }

    func initBoard() {
        board.append(a1Btn)
        board.append(a2Btn)
        board.append(a3Btn)
        board.append(b1Btn)
        board.append(b2Btn)
        board.append(b3Btn)
        board.append(c1Btn)
        board.append(c2Btn)
        board.append(c3Btn)
    }

    @IBAction func boardBtnClicked(_ sender: UIButton) {
        addToBoard(sender)
        if checkForVictory(CROSS) {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        if checkForVictory(NOUGHT) {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        if fullBoard() {
            resultAlert(title: "Draw")
        }
    }

    func checkForVictory(_ s: String) -> Bool {
        // Horizontal Victory
        if thisSymbol(a1Btn, s) && thisSymbol(a2Btn, s) && thisSymbol(a3Btn, s) {
            return true
        }
        if thisSymbol(b1Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(b3Btn, s) {
            return true
        }
        if thisSymbol(c1Btn, s) && thisSymbol(c2Btn, s) && thisSymbol(c3Btn, s) {
            return true
        }

        // Vertical Victory
        if thisSymbol(a1Btn, s) && thisSymbol(b1Btn, s) && thisSymbol(c1Btn, s) {
            return true
        }
        if thisSymbol(a2Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c2Btn, s) {
            return true
        }
        if thisSymbol(a3Btn, s) && thisSymbol(b3Btn, s) && thisSymbol(c3Btn, s) {
            return true
        }

        // Diagonal Victory
        if thisSymbol(a1Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c3Btn, s) {
            return true
        }
        if thisSymbol(a3Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c1Btn, s) {
            return true
        }

        return false
    }

    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }

    func resultAlert(title: String) {
        print("Result Alert: \(title)")
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { [self] (_) in
            print("Reset button clicked")
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }

    func resetBoard() {
        print("Resetting board")
        for button in board {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }

        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            turnLbl.text = CROSS
        } else {
            firstTurn = Turn.Nought
            turnLbl.text = NOUGHT
        }

        currentTurn = firstTurn
        print("Board reset complete")
    }

    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }

    func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.Nought {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLbl.text = CROSS
            } else if currentTurn == Turn.Cross {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLbl.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}
