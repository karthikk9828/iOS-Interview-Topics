import Foundation

/**
    Open Closed Principle
        - Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.
*/

//MARK: - ----------------------------- Non-SOLID Code ------------------------------

class PaymentProcessor {
    func processPayment(paymentType: String) {
        if paymentType == "CreditCard" {
            // Process credit card payment
        } else if paymentType == "PayPal" {
            // Process PayPal payment
        }
    }
}

//MARK: - ----------------------------- SOLID Code ------------------------------

protocol Payment {
    func processPayment()
}

class CreditCardPayment: Payment {
    func processPayment() {
        // Process credit card payment
    }
}

class PayPalPayment: Payment {
    func processPayment() {
        // Process PayPal payment
    }
}

class PaymentProcessor {
    func processPayment(payment: Payment) {
        payment.processPayment()
    }
}
