# UILayoutKit

Autlayout helper


### Simple Example:
```swift
label.top(10).left(5).right(20).bottom()
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
