final class ValidationNumber {
    static func isNumberValid (_ number: String) -> Bool {
        guard number.count == 10,
              let _ = Int(number)
        else {
            return false
        }
        return true
    }
}
