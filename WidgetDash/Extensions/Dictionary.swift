//  Created by Илья Кузнецов on 20/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

enum GetValueWithCastError: Error {
    case valueNotExist(String)
    case castFailed(String)

    public var localizedDescription: String {
        switch self {
        case let .valueNotExist(message),
             let .castFailed(message):
            return message
        }
    }
}

extension Dictionary {
    func getValueWithCast<ValueType>(key: Key) throws -> ValueType {
        guard let value = self[key] else {
            throw GetValueWithCastError.valueNotExist("Value for key \(key) doesn't exist")
        }
        guard let castedValue = value as? ValueType else {
            throw GetValueWithCastError.castFailed("Failed cast value for key \(key) to type \(ValueType.self)")
        }
        return castedValue
    }
    
    public func get<ValueType, KeyType: RawRepresentable>(
        _ key: KeyType
        ) throws -> ValueType where KeyType.RawValue == Key {
        return try getValueWithCast(key: key.rawValue)
    }
}

