//
//  Created by Vijith TV
//

import UIKit

extension UIView {
    
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
    
    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
    
    public var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.leftAnchor
        } else {
            return leftAnchor
        }
    }
    
    public var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }
    
    public var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }
    
    public var safeCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.centerXAnchor
        } else {
            return centerXAnchor
        }
    }
    
    public var safeCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *), isSafeAreaEnabled {
            return safeAreaLayoutGuide.centerYAnchor
        } else {
            return centerYAnchor
        }
    }
}
