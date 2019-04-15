//
//  RxViewController.swift
//  RxPractice
//
//  Created by 内田 大輔 on 2019/04/10.
//  Copyright © 2019 Sue1215. All rights reserved.
//

import RxSwift
import RxCocoa

class RxViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countResetButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private var viewModel: CounterRxViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = CounterRxViewModel()
        let input = CounterViewModelInput(
            countUpButton: countUpButton.rx.tap.asObservable(),
            countDownButton: countDownButton.rx.tap.asObservable(),
            countResetButton: countResetButton.rx.tap.asObservable()
        )
        viewModel.setup(input: input)
//        if let aaa = countLabel.text {
//            viewModel.outputs?.counterText
//                .drive(aaa)
//                .disposed(by: disposeBag)
//        }
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
