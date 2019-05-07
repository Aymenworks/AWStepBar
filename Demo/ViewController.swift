//
//  ViewController.swift
//  Demo
//
//  Created by Aymen Rebouh on 2019/05/07.
//  Copyright © 2019 Aymenworks. All rights reserved.
//

import UIKit
import AWStepBar

class ViewController: UIViewController, AWStepBarDataSource {

    @IBOutlet weak var storyboardStepBar: AWStepBar! {
        didSet {
            storyboardStepBar.dataSource = self
            storyboardStepBar.dotColor = .gray
            storyboardStepBar.set(step: 2, animated: false)
            storyboardStepBar.dotSelectedColor = .white
            storyboardStepBar.stepBarForegroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            storyboardStepBar.stepBarBackgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        }
    }
    
    let stepBar = AWStepBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stepBar)
        stepBar.dataSource = self
        stepBar.dotColor = .gray
        stepBar.dotSelectedColor = .white
        stepBar.stepBarForegroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        stepBar.stepBarBackgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        stepBar.set(step: 1, animated: false)

        stepBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            stepBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            stepBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stepBar.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stepBar.set(step: 2, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stepBar.set(step: 3, animated: true)
            self.storyboardStepBar.set(step: 3, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.stepBar.set(step: 1, animated: true)
            self.storyboardStepBar.set(step: 1, animated: true)
        }
    }
    
    func numberOfSteps(in stepBar: AWStepBar) -> Int {
        return 3
    }
}

