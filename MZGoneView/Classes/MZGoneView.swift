//
//  MZGoneView.swift
//  MZGoneView
//
//  Created by muzcity on 2017. 10. 15..
//

import UIKit

public enum GONE_DIRECTION : UInt {
    case visible
    case goneWidth
    case goneHeight
}

public class MZGoneView: UIView {
    
    var widthContraint : NSLayoutConstraint!
    var heightContraint : NSLayoutConstraint!
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        lowerPriority(self)
    }
    
    private func lowerPriority(_ view : UIView) {
        for con in view.constraints {
            
            // 충돌을 막기위해 priority를 1000 -> 999로 낮춘다.
            // swift 3.2 4.0 호환하기 위해서 아래와 같이 처리.
            if con.priority == UILayoutPriority(1000) {
                con.priority = UILayoutPriority(999)
            }
            
        }
    }
    
    
    private func setLayout(_ direction : GONE_DIRECTION) {
        
        if direction == .goneWidth {
            widthContraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
            self.addConstraint(widthContraint)
        }
        if direction == .goneHeight {
            heightContraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
            self.addConstraint(heightContraint)
        }
        
        self.clipsToBounds = true
    }
    
    private func removeLayout() {
        if let w = widthContraint {
            self.removeConstraint(w)
        }
        if let h = heightContraint {
            self.removeConstraint(h)
        }
        
        widthContraint = nil
        heightContraint = nil
    }
    
    open func gone(direction: GONE_DIRECTION, animated: Bool) {
        
        if direction == .visible {
            removeLayout()
        }
        else {
            setLayout(direction)
        }
        
        if animated {
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.superview?.layoutIfNeeded()
            })
        }
    }
}
