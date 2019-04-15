//
//  ViewController.swift
//  RxPractice
//
//  Created by 内田 大輔 on 2019/04/10.
//  Copyright © 2019 Sue1215. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!

    private var viewModel: CounterViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CounterViewModel()
    }
    @IBAction func countUp(_ sender: Any) {
        viewModel.incrementCount(callback: { [weak self]count in
            self?.updateCountLabel(count)
        })
    }
    @IBAction func countDown(_ sender: Any) {
        viewModel.decrementCount(callback: { [weak self]count in
            self?.updateCountLabel(count)
        })
    }
    @IBAction func countReset(_ sender: Any) {
        viewModel.resetCount(callback: { [weak self]count in
            self?.updateCountLabel(count)
        })
    }

    private func updateCountLabel(_ count:Int) {
        countLabel.text = String(count)
    }

}
