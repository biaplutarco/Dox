//
//  ValueDebtCell.swift
//  Dox
//
//  Created by Bia Plutarco on 28/05/19.
//  Copyright © 2019 Bia Plutarco. All rights reserved.
//

import UIKit

class ValueDebtCell: UITableViewCell {

    lazy var mockLabel: MockLabel = {
        let mockLabel = MockLabel(text: mockLabelTitle, type: .viewNewDebt)
        mockLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mockLabel)
        return mockLabel
    }()
    
    lazy var symbolTextField: CardTextField = {
        let textField = CardTextField(backgroundColor: UIColor.AppColors.lightGray)
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textField)
        return textField
    }()
    
    lazy var valueTextField: CardTextField = {
        let textField = CardTextField(backgroundColor: UIColor.AppColors.lightGray)
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textField)
        return textField
    }()
    
    lazy var mockLabelTitle: MockLabelText = {
        let mockLabelTitle = MockLabelText.error
        return mockLabelTitle
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    func setupCell(title: MockLabelText) {
        self.contentView.backgroundColor = UIColor.AppColors.orange
        self.mockLabelTitle = title
        configConstraints()
    }
}

extension ValueDebtCell {
    private func configConstraints() {
        NSLayoutConstraint.activate([
            mockLabel.topAnchor.constraint(equalTo: self.topAnchor),
            mockLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            mockLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            symbolTextField.topAnchor.constraint(equalTo: mockLabel.bottomAnchor, constant: 8),
            symbolTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            symbolTextField.rightAnchor.constraint(equalTo: valueTextField.leftAnchor, constant: -12),
            symbolTextField.widthAnchor.constraint(equalToConstant: 76),
            symbolTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            valueTextField.topAnchor.constraint(equalTo: mockLabel.bottomAnchor, constant: 8),
            valueTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            valueTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
