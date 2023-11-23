//
//  CountryManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.11.2023.
//

import Foundation

class CountryManager {
    static var shared: CountryManager = CountryManager()
    var countries: [String] = []
    
    private init() {
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
    }
    
    func flag(forCountryCode countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    func currentUserFlag() -> String {
        guard !FutbolyVault.shared.user.country.isEmpty else { return "" }
        let countryCode = countryCode(for: FutbolyVault.shared.user.country)
        return flag(forCountryCode: countryCode)
    }
    
    private func countryCode(for fullCountryName : String) -> String {
        var locales : String = ""
        for localeCode in NSLocale.isoCountryCodes {
            let identifier = NSLocale(localeIdentifier: localeCode)
            let countryName = identifier.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)
            if fullCountryName.lowercased() == countryName?.lowercased() {
                return localeCode as String
            }
        }
        return locales
    }
}
