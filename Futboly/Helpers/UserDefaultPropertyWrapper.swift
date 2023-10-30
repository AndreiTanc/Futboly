//
//  UserDefaultPropertyWrapper.swift
//  Futboly
//
//  Created by Andrei Tanc on 25.08.2023.
//

import Foundation

@propertyWrapper struct UserDefault<Value: Codable> {
    let key: String
    var container: UserDefaults = .standard

    var wrappedValue: Value? {
        get {
            if let data = container.object(forKey: key) as? Data {
                let decoder = JSONDecoder()
                return try? decoder.decode(Value.self, from: data)
            }
            return nil
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                container.set(encoded, forKey: key)
            }
            container.synchronize()
        }
    }
}
