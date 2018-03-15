//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

let animator = UIDynamicAnimator(referenceView: containerView)

var itens = [UIView]()
for i in 1...20 {

    let square = UIView(frame: CGRect(x: 15*i, y: 10, width: 10, height: 10))
    square.backgroundColor = UIColor.blue
    containerView.addSubview(square)
    
    itens.append(square)
}

let dItem = UIDynamicItemBehavior(items: itens)
dItem.elasticity = 1.0
animator.addBehavior(dItem)

let gravity = UIGravityBehavior(items: itens)
let collision = UICollisionBehavior(items: itens)
collision.translatesReferenceBoundsIntoBoundary = true

let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
square.backgroundColor = UIColor.red
containerView.addSubview(square)
gravity.addItem(square)
collision.addItem(square)

animator.addBehavior(gravity)
animator.addBehavior(collision)

//: [Next](@next)

