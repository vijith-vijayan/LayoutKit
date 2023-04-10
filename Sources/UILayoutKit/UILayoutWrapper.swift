//
//  Created by Vijith TV
//

import UIKit

@propertyWrapper
public struct AutoLayout<Value: UIView> {
    
    public var wrappedValue: Value {
        didSet {
            setup()
        }
    }
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        setup()
    }
    
    func setup() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}

