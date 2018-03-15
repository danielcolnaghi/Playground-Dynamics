//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

let animator = UIDynamicAnimator(referenceView: containerView)

let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
square.backgroundColor = UIColor.red
containerView.addSubview(square)

let blue = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
blue.layer.cornerRadius = 25
blue.backgroundColor = UIColor.blue
containerView.addSubview(blue)

let dItem = UIDynamicItemBehavior(items: [blue])
dItem.elasticity = 1.0
dItem.angularResistance = 0
dItem.resistance = 0
animator.addBehavior(dItem)

let gravity = UIGravityBehavior(items: [square, blue])
let collision = UICollisionBehavior(items: [square, blue])
collision.translatesReferenceBoundsIntoBoundary = true

let push = UIPushBehavior(items: [blue], mode: .instantaneous)
push.angle = 0.5
push.magnitude = 5.0

let snap = UISnapBehavior(item: square, snapTo: CGPoint(x: 200, y: 250))
snap.damping = 10

let att = UIAttachmentBehavior(item: square, attachedTo: blue)
att.length = 120

animator.addBehavior(gravity)
animator.addBehavior(collision)
animator.addBehavior(snap)
//animator.addBehavior(att)
animator.addBehavior(push)

//: [Next](@next)
