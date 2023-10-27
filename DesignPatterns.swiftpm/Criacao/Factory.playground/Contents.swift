// MARK: - Criação: Factory

protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro: Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar: Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

enum Country {
    case UnitedStates, Spain, UK, Greece
}

class CurrencyFactory {
    class func currencyForCountry(country: Country) -> Currency? {
        switch country {
        case .Spain, .Greece:
            return Euro()
        case .UnitedStates:
            return UnitedStatesDolar()
        default:
            return nil
        }
    }
}

// MARK: - Usage

let noCurrencyCode = "No Currency Code Available"

CurrencyFactory.currencyForCountry(country: .Greece)?.code() ?? noCurrencyCode
CurrencyFactory.currencyForCountry(country: .Spain)?.code() ?? noCurrencyCode
CurrencyFactory.currencyForCountry(country: .UnitedStates)?.code() ?? noCurrencyCode
CurrencyFactory.currencyForCountry(country: .UK)?.code() ?? noCurrencyCode
