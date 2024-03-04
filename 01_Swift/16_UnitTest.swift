
import XCTest

class TipCalculation {
    func calculateTip(of enteredAmount: Double, with tip: Double) -> Double? {
        guard enteredAmount >= 0 else {
            return nil
        }
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
    }
}

class TipCalculationTests: XCTestCase {

    func testSuccessfulTipCalculation() {
        
        // Arrange 
        let calculator = TipCalculation() 
        let enteredAmount = 100.00
        let tipSlider = 25.0

        // Act 
        let tip = calculator.calculateTip(of: enteredAmount, with: tipSlider)

        // Assert
        XCAssertEqual(tip, 25)
    }

}
