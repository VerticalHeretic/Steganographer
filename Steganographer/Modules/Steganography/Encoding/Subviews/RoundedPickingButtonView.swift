//
//  RoundedPickingButtonView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

final class RoundedPickingButtonView: XibView {

    var pickAction: SimpleAction?

    @IBOutlet private var containerView: UIView!
    @IBOutlet private var buttonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupGestures()
    }

    func setTitleWithAttributed(_ attributedString: NSMutableAttributedString) {
        setupView()
        setupGestures()
        buttonLabel.attributedText = attributedString
    }

    func setTitleWithNormal(_ string: String) {
        setupView()
        setupGestures()
        buttonLabel.text = string
    }
}

private extension RoundedPickingButtonView {

    private func setupView() {
        containerView.layer.cornerRadius = 15
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
    }
}

private extension RoundedPickingButtonView {

    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap))
        containerView.addGestureRecognizer(tap)
    }

    @objc func tap() {
        pickAction?()
    }
}