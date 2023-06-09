//
//  Created by Vijith TV
//

import UIKit

public struct UILayoutConstraintAttribute<T: AnyObject> {
    let anchor: NSLayoutAnchor<T>
    let const: CGFloat
}

public struct UILayoutGuideAttribute {
    let guide: UILayoutSupport
    let const: CGFloat
}

public func + <T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> UILayoutConstraintAttribute<T> {
    UILayoutConstraintAttribute(anchor: lhs, const: rhs)
}

public func + (lhs: UILayoutSupport, rhs: CGFloat) -> UILayoutGuideAttribute {
    UILayoutGuideAttribute(guide: lhs, const: rhs)
}

public func + <T>(lhs: UILayoutConstraintAttribute<T>, rhs: CGFloat) -> UILayoutConstraintAttribute<T> {
    UILayoutConstraintAttribute(anchor: lhs.anchor, const: lhs.const + rhs)
}

public func - <T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> UILayoutConstraintAttribute<T> {
    UILayoutConstraintAttribute(anchor: lhs, const: -rhs)
}

public func - (lhs: UILayoutSupport, rhs: CGFloat) -> UILayoutGuideAttribute {
    UILayoutGuideAttribute(guide: lhs, const: -rhs)
}

public func - <T>(lhs: UILayoutConstraintAttribute<T>, rhs: CGFloat) -> UILayoutConstraintAttribute<T> {
    UILayoutConstraintAttribute(anchor: lhs.anchor, const: lhs.const - rhs)
}

precedencegroup UILayoutEquivalence {
    higherThan: ComparisonPrecedence
    lowerThan: AdditionPrecedence
}

infix operator <=: UILayoutEquivalence
infix operator =>: UILayoutEquivalence

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: UILayoutSupport) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs.bottomAnchor).activate()
}

@discardableResult
public func == <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == <T>(lhs: NSLayoutAnchor<T>, rhs: UILayoutConstraintAttribute<T>) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs.anchor, constant: rhs.const).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: UILayoutGuideAttribute) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs.guide.bottomAnchor, constant: rhs.const).activate()
}

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.constraint(equalToConstant: rhs).activate()
}

@discardableResult
public func <= <T>(lhs: NSLayoutAnchor<T>, rhs: UILayoutConstraintAttribute<T>) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.const).activate()
}

@discardableResult
public func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualTo: rhs).activate()
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualToConstant: rhs).activate()
}

@discardableResult
public func => <T>(lhs: NSLayoutAnchor<T>, rhs: UILayoutConstraintAttribute<T>) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.const).activate()
}

@discardableResult
public func => (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualToConstant: rhs).activate()
}

@discardableResult
public func => (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

@discardableResult
public func => (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

private extension NSLayoutConstraint {
    func activate() -> Self {
        isActive = true
        return self
    }
}

