import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
square.backgroundColor = UIColor.gray
containerView.addSubview(square)

let animator = UIDynamicAnimator(referenceView: containerView)
let gravity = UIGravityBehavior(items: [square])
animator.addBehavior(gravity)

let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
barrier.backgroundColor = UIColor.red
containerView.addSubview(barrier)

let collision = UICollisionBehavior(items: [square])
collision.translatesReferenceBoundsIntoBoundary = true
animator.addBehavior(collision)

let rightEdge = CGPoint(x: barrier.frame.origin.x + barrier.frame.size.width, y: barrier.frame.origin.y)
collision.addBoundary(withIdentifier:"barrier" as NSCopying, from: barrier.frame.origin, to: rightEdge)

//: [Next](@next)
