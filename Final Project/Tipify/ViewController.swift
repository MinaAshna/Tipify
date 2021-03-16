/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  // MARK: - Outlets

  @IBOutlet weak var tipPercentageLabel: UILabel!
  @IBOutlet weak var tipAmountLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!


  // MARK: - Private variables
  private var tipPercentage = 15
  private var billTextFieldValue = ""
  private var tipAmount = 0.0

  // MARK: - View life cycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

  }

  // MARK: - Actions

  @IBAction func increaseTipPercentage(_ sender: UIButton) {
    // 1
    tipPercentage += 1
    // 2
    tipPercentageLabel.text = String(tipPercentage)

    calculateTipAmount()
    calculateTotalAmount()
  }

  @IBAction func decreaseTipPercentage(_ sender: UIButton) {
    // 1
    if tipPercentage > 0 {
      // 2
      tipPercentage -= 1
      // 3
      tipPercentageLabel.text = String(tipPercentage)
    }

    calculateTipAmount()
    calculateTotalAmount()
  }

  // MARK: - Calculator
  private func calculateTipAmount() {
    // 1
    if let billValue = Double(billTextFieldValue) {
      tipAmount = billValue * Double(tipPercentage) / 100
    } else {
      // 2
      tipAmount = 0
    }

    // 3
    tipAmountLabel.text = String(format: "%.2f", tipAmount)
  }

  private func calculateTotalAmount() {
    var totalAmount: Double = 0

    // 1
    if let billValue = Double(billTextFieldValue) {
      totalAmount = billValue + tipAmount
    } else {
      // 2
      totalAmount = 0
    }

    // 3
    totalAmountLabel.text = String(format: "%.2f", totalAmount)
  }

  // MARK: - UITextFieldDelegate
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // 1
    if string.isEmpty {
      // 2
      billTextFieldValue = String(billTextFieldValue.dropLast())
    } else {
      // 3
      billTextFieldValue += string
    }

    calculateTipAmount()
    calculateTotalAmount()

    return true
  }
}
