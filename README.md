# UILayoutKit

Autlayout helper


### Simple Example:
```swift
label.top(10).left(5).right(20).bottom()
```

### Pins edge to edge and with inset:
```swift
tableView.pin()
scrollView.pin(10)
```

### Different components:
```swift
label.topAnchor == customView.bottomAnchor + 7.0
label.leftAnchor == customView.leftAnchor + 15.0
label.rightAnchor == customView.rightAnchor - 4.0
```

### Combinations:
```swift

@AutoLayout var label = UILabel()
label.centerY().left(8)

label.centerY().centerX()

label
   .left(to: .right(20), of: label)
   .top(to: switcher)
   .right(24)
```

### Enabling safe area API
```swift
collectionView.left().right().safeArea { $0.top().bottom(10) }
```
