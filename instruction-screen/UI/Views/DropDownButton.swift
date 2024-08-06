// DropDownButton.swift
// instruction-screen
// Created by Mac on 8/6/24.

import Foundation
import UIKit
import RxCocoa
import RxSwift
import SnapKit

class DropDownButton: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        return label
    }()
    
    private lazy var chevronDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron_down_image")
        return imageView
    }()
    
    private lazy var titleContainerView = UIView()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private var isExtending = false
    private let disposeBag = DisposeBag()
    private let tapGesture = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
        setupBindings()
    }
    
    func bind(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

private extension DropDownButton {
    
    func configUI() {
        self.makeRoundedCornerWithShadow(cornerRadius: 8)
        self.backgroundColor = .white
        self.descriptionLabel.isHidden = true
        
        // Adding subviews
        titleContainerView.addSubview(titleLabel)
        titleContainerView.addSubview(chevronDownImageView)
        stackView.addArrangedSubview(titleContainerView)
        stackView.addArrangedSubview(descriptionLabel)
        self.addSubview(stackView)
        
        // Configuring constraints
        setupConstraints()
        self.addGestureRecognizer(tapGesture)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        titleContainerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.lessThanOrEqualTo(chevronDownImageView.snp.leading).offset(-10)
        }
        
        chevronDownImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(6)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
        }
    }
    
    func setupBindings() {
        tapGesture.rx.event
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                // Toggle the visibility of the descriptionLabel
                self.descriptionLabel.isHidden = self.isExtending
                
                // Calculate rotation angle based on the new state
                let rotationAngle: CGFloat = self.isExtending ? 0 : .pi // 180 degrees in radians
                
                // Apply rotation with animation
                UIView.animate(withDuration: 0.3) {
                    self.chevronDownImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
                }
                
                // Update the isExtending state
                self.isExtending.toggle()
            })
            .disposed(by: disposeBag)
    }

}
