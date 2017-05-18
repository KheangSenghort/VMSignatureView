//
//  VMSignatureView.swift
//  VMSignatureViewExample
//
//  Created by Vaibhav Misra on 17/05/17.
//  Copyright © 2017 Vaibhav Misra. All rights reserved.
//

import UIKit

public protocol VMSignatureDelegate: NSObjectProtocol {
    func startedDrawing()
    func finishedDrawing()
}

class VMSignatureView: UIView {

    // MARK: - Public properties
    public weak var delegate: VMSignatureDelegate?
    
    @IBInspectable public var strokeWidth: CGFloat = 2.0 {
        didSet {
            self.path.lineWidth = strokeWidth
        }
    }
    
    @IBInspectable public var strokeColor: UIColor = .black {
        didSet {
            self.strokeColor.setStroke()
        }
    }
    
    // Computed Property returns true if the view actually contains a signature
    public var hasSignature: Bool {
        get {
            if self.path.isEmpty {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: - Private properties
    private var path = UIBezierPath()
    private var incrementalImage: UIImage?
    
    // MARK: - Init
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isMultipleTouchEnabled = false
        self.path.lineWidth = self.strokeWidth
        self.path.lineJoinStyle = CGLineJoin.round
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.isMultipleTouchEnabled = false
        self.path.lineWidth = self.strokeWidth
        self.path.lineJoinStyle = CGLineJoin.round
    }
    
    // MARK: - Draw
    override public func draw(_ rect: CGRect) {
        self.incrementalImage?.draw(in: rect)
        self.strokeColor.setStroke()
        self.path.stroke()
    }
    
    //MARK: - Touches methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch: UITouch = touches.first {
            let touchPoint: CGPoint = touch.location(in: self)
            self.path.move(to: touchPoint)
        }
        
        if let delegate = self.delegate {
            delegate.startedDrawing()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch: UITouch = touches.first {
            let touchPoint: CGPoint = touch.location(in: self)
            self.path.addLine(to: touchPoint)
            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: UITouch = touches.first {
            let lastPoint: CGPoint = touch.location(in: self)
            self.path.addLine(to: lastPoint)
            self.drawBitmap()
            self.setNeedsDisplay()
        }
        
        if let delegate = self.delegate {
            delegate.finishedDrawing()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesEnded(touches, with: event)
    }
    
    //MARK: - Helper methods
    private func drawBitmap() {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.strokeColor.setStroke()
        if self.incrementalImage == nil {
            let rectPath = UIBezierPath(rect: self.bounds)
            UIColor.white.setFill()
            rectPath.fill()
        }
        self.incrementalImage?.draw(at: CGPoint.zero)
        path.stroke()
        self.incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: - Methods for interacting with Signature View
    
    // Clear the Signature View
    public func clear() {
        self.path.removeAllPoints()
        self.incrementalImage = nil
        self.setNeedsDisplay()
    }
    
    // Save the Signature as an UIImage
    public func getSignature(scale:CGFloat = 1) -> UIImage? {
        if !self.hasSignature { return nil }
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, scale)
        self.path.stroke()
        let signature = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return signature
    }
    
}
