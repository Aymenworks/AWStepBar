//
//  AWStepBar.swift
//  AWStepBar
//
//  Created by Aymen Rebouh on 2019/05/07.
//  Copyright © 2019 Aymenworks. All rights reserved.
//

import Foundation
import Foundation
import UIKit

public class AWStepBar: UIView {
    
    // MARK: Developer Experience - How to use this component

    /// Use that function to change the step manually.
    public func set(step: Int, animated: Bool) {
        currentStep = step

        guard didLayoutSubview else { return }

        guard numberOfSteps != nil else {
            assertionFailure("numberOfDigits property is not set")
            return
        }
        
        let trailing = bounds.width - ((CGFloat(currentStep)/CGFloat(numberOfSteps)*bounds.width))
        
        if animated {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.foregroundViewTrailingConstraint?.constant = -trailing
                self.layoutIfNeeded()
            }, completion: nil)

        } else {
            self.foregroundViewTrailingConstraint?.constant = -trailing
        }
    }
    
    public var numberOfSteps: Int!
    
    // MARK: Customization - What can be customized

    public var stepBarForegroundColor: UIColor = .red {
        didSet {
            foregroundView.backgroundColor = stepBarForegroundColor
        }
    }
    
    public var stepBarBackgroundColor: UIColor = .blue {
        didSet {
            backgroundColor = stepBarBackgroundColor
        }
    }
    
    public var dotColor: UIColor = .green {
        didSet {
            itemsViews.forEach { $0.dotView.backgroundColor = dotColor }
        }
    }
    
    public var dotSelectedColor: UIColor = .purple {
        didSet {
            foregroundDotView.backgroundColor = dotSelectedColor
        }
    }
    
    //  MARK: Private
    
    private let stackView = UIStackView()
    private let foregroundView = UIView()
    private let foregroundDotView = UIView()
    private let foregroundDotViewMargin: UIEdgeInsets = .init(top: 1, left: 0, bottom: 1, right: 1)

    private var currentStep = 0
    private var itemsViews: [StepBarItem] = []
    private var foregroundViewTrailingConstraint: NSLayoutConstraint?
    private var didLayoutSubview = false

    // MARK: Lifecycle

    convenience init() {
        self.init(frame: .zero)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // We setup the views only once when the layout did subviews
        if didLayoutSubview == false {
            defer { didLayoutSubview = true }
            setup()
        }
        
        guard numberOfSteps != nil else {
            assertionFailure("numberOfDigits property is not set")
            return
        }
        
        // Initial laoyut
        let trailing = bounds.width - ((CGFloat(currentStep)/CGFloat(numberOfSteps)*bounds.width))
        foregroundViewTrailingConstraint?.constant = -trailing
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        layer.cornerRadius = bounds.height / 2.0
        foregroundView.layer.cornerRadius = layer.cornerRadius
        foregroundDotView.layer.cornerRadius = (bounds.height-foregroundDotViewMargin.top-foregroundDotViewMargin.bottom) / 2.0
    }

    // MARK: Setup
    
    private func setup() {
        backgroundColor = stepBarBackgroundColor
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        guard numberOfSteps != nil else {
            assertionFailure("numberOfDigits property is not set")
            return
        }
        
        for _ in 0..<numberOfSteps {
            let item = StepBarItem()
            item.dotView.backgroundColor = dotColor
            itemsViews.append(item)
            stackView.addArrangedSubview(item)
        }
        
        addSubview(stackView)
        
        foregroundView.backgroundColor = stepBarForegroundColor
        foregroundDotView.backgroundColor = dotSelectedColor
        foregroundView.addSubview(foregroundDotView)
        
        addSubview(foregroundView)
        
        layout: do {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                stackView.topAnchor.constraint(equalTo: self.topAnchor),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            stackView.translatesAutoresizingMaskIntoConstraints = false

            
            foregroundViewTrailingConstraint = foregroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -bounds.width)

            NSLayoutConstraint.activate([
                foregroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                foregroundView.topAnchor.constraint(equalTo: self.topAnchor),
                foregroundViewTrailingConstraint!,
                foregroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            foregroundView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                foregroundDotView.widthAnchor.constraint(equalTo: foregroundDotView.heightAnchor),
                foregroundDotView.topAnchor.constraint(equalTo: foregroundView.topAnchor, constant: foregroundDotViewMargin.top),
                foregroundDotView.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -foregroundDotViewMargin.right),
                foregroundDotView.bottomAnchor.constraint(equalTo: foregroundView.bottomAnchor, constant: -foregroundDotViewMargin.bottom)
                ])
            foregroundDotView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

fileprivate class StepBarItem: UIView {
    
    let dotView = UIView()
    private let dotViewMargin: UIEdgeInsets = .init(top: 1, left: 0, bottom: 1, right: 1)

    // MARK: Lifecycle
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        addSubview(dotView)
        
        layout: do {
            dotView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dotView.widthAnchor.constraint(equalTo: dotView.heightAnchor),
                dotView.topAnchor.constraint(equalTo: self.topAnchor, constant: dotViewMargin.top),
                dotView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -dotViewMargin.right),
                dotView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -dotViewMargin.bottom)
                ])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Integrate required init?(coder aDecoder: NSCoder)")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dotView.layer.cornerRadius = dotView.bounds.height / 2
    }
}
