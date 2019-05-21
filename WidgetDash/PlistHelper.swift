//  Created by Илья Кузнецов on 17/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class PlistHelper {
    func getPlist(withName name: String) -> [String: [[String: Any]]]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: [[String: Any]]]
        }
        return nil
    }
}
