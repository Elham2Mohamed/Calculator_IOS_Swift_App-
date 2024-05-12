import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var currentInput: String = ""
    var currentValue: Double?
    var result: Double = 0
    var operatorChar: Character = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            currentInput += digit
            updateDisplay()
        }
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let op = sender.titleLabel?.text?.first {
            if let value = Double(currentInput) {
                performOperation(value)
            }
            operatorChar = op
            currentInput = ""
        }
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        if let value = Double(currentInput) {
            performOperation(value)
        }
    }
    
    private func performOperation(_ secondOperand: Double) {
        if let firstOperand = currentValue {
            switch operatorChar {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "*":
                result = firstOperand * secondOperand
            case "/":
                if secondOperand != 0 {
                    result = firstOperand / secondOperand
                } else {
                    result = 0
                }
            case "%":
                result = firstOperand / 100
            default:
                break
            }
            currentInput = "\(result)"
            updateDisplay()
        } else {
            result = secondOperand
        }
        currentValue = result
    }
    
    @IBAction func changeSign(_ sender: Any) {
        if let value = Double(currentInput) {
            currentValue = -value
            currentInput = "\(currentValue ?? 0)"
            updateDisplay()
        }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        currentInput = ""
        currentValue = nil
        result = 0
        updateDisplay()
    }
    
    func updateDisplay() {
        displayLabel.text = currentInput
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if !currentInput.contains(".") {
            currentInput += "0."
            updateDisplay()
        }
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if currentInput.count > 0 {
            currentInput.removeLast()
            updateDisplay()
        }
    }
}
