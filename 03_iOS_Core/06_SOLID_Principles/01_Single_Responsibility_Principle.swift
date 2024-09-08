import Foundation

/**
    Single Responsibility Principle
        - states that a class should only be responsible for one thing 
*/

//MARK: - ----------------------------- Non-SOLID Code ------------------------------

class Report {
    func generateReport() {
        // Logic to generate report
    }

    func saveToFile() {
        // Logic to save report to a file
    }

    func sendReportByEmail() {
        // Logic to send report via email
    }
}


//MARK: - ----------------------------- SOLID Code ------------------------------

class ReportGenerator {
    func generateReport() {
        // Logic to generate report
    }
}

class ReportSaver {
    func saveToFile(report: String) {
        // Logic to save report to a file
    }
}

class ReportSender {
    func sendReportByEmail(report: String) {
        // Logic to send report via email
    }
}
