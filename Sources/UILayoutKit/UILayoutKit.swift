//
//  Created by Vijith TV
//

import UIKit

public enum LayoutSide {
    case top(CGFloat)
    case bottom(CGFloat)
    case leading(CGFloat)
    case trailing(CGFloat)
}

public enum LayoutDirection {
    case top
    case bottom
    case left
    case right
}

var isSafeAreaEnabled: Bool = false

extension UIView {
    
    private func setup(_ view: UIView?) -> UIView {
        guard view == nil
        else { return view! }
        
        guard let superview
        else { fatalError("No superview for you view") }
        return superview
    }
    
    @inline(__always)
    private func side(for direction: LayoutDirection,
                      inset: CGFloat = 0.0
    ) -> LayoutSide {
        switch direction {
        case .top: return .top(inset)
        case .bottom: return .bottom(inset)
        case .left: return .leading(inset)
        case .right:return .trailing(inset)
        }
    }
    
    @inline(__always)
    private func direction(for side: LayoutSide) -> (LayoutDirection, CGFloat) {
        switch side {
        case .top(let inset):
            return (.top, inset)
        case .bottom(let inset):
            return (.bottom, inset)
        case .leading(let inset):
            return (.left, inset)
        case .trailing(let inset):
            return (.right, inset)
        }
    }
    
    private func anchorX(for side: LayoutSide) -> NSLayoutXAxisAnchor {
        switch side {
        case .leading: return safeLeadingAnchor
        case .trailing: return safeTrailingAnchor
        default: fatalError("Incorrect LayoutSide")
        }
    }
    
    private func anchorY(for side: LayoutSide) -> NSLayoutYAxisAnchor {
        switch side {
        case .top: return safeTopAnchor
        case .bottom: return safeBottomAnchor
        default: fatalError("Incorrect LayoutSide")
        }
    }
   
    @discardableResult
    public func safeArea(_ view: ((UIView) -> Void)) -> Self {
        isSafeAreaEnabled = true
        view(self)
        isSafeAreaEnabled = false
        return self
    }
    
    @discardableResult
    public func centerY(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeCenterYAnchor == view.safeCenterYAnchor + inset
        return self
    }

    @discardableResult
    public func centerX(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeCenterXAnchor == view.safeCenterXAnchor + inset
        return self
    }

    @discardableResult
    public func centerWithInsets(x: CGFloat = 0.0, y: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeCenterYAnchor == view.safeCenterYAnchor + y
        safeCenterXAnchor == view.safeCenterXAnchor + x
        return self
    }

    @discardableResult
    public func height(_ value: CGFloat = 0.0) -> UIView {
        heightAnchor == value
        return self
    }

    @discardableResult
    public func height(value: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        heightAnchor == view.heightAnchor + value
        return self
    }

    @discardableResult
    public func width(_ value: CGFloat = 0.0) -> UIView {
        widthAnchor == value
        return self
    }

    @discardableResult
    public func width(value: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        widthAnchor == view.widthAnchor + value
        return self
    }

    @discardableResult
    public func left(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeLeadingAnchor == view.safeLeadingAnchor + inset
        return self
    }

    @discardableResult
    public func left(to side: LayoutSide, of toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        let (_, inset) = direction(for: side)
        safeLeadingAnchor == view.anchorX(for: side) + inset
        return self
    }

    @discardableResult
    public func right(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeTrailingAnchor == view.safeTrailingAnchor - inset
        return self
    }

    @discardableResult
    public func right(to side: LayoutSide, of toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        let (_, inset) = direction(for: side)
        safeTrailingAnchor == view.anchorX(for: side) - inset
        return self
    }

    @discardableResult
    public func top(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeTopAnchor == view.safeTopAnchor + inset
        return self
    }

    @discardableResult
    public func top(to side: LayoutSide, of toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        let (_, inset) = direction(for: side)
        safeTopAnchor == view.anchorY(for: side) + inset
        return self
    }

    @discardableResult
    public func bottom(_ inset: CGFloat = 0.0, to toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        safeBottomAnchor == view.safeBottomAnchor - inset
        return self
    }

    @discardableResult
    public func bottom(to side: LayoutSide, of toView: UIView? = nil) -> UIView {
        let view = setup(toView)
        let (_, inset) = direction(for: side)
        safeBottomAnchor == view.anchorY(for: side) - inset
        return self
    }
    
}

extension NSLayoutDimension {
    
    /// AspectFit dimenions
    public func aspectFit(to dimension: NSLayoutDimension, as multiplier: CGFloat) {
        constraint(equalTo: dimension, multiplier: multiplier).isActive = true
    }
}
