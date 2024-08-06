//
//  ViewController.swift
//  instruction-screen
//
//  Created by Mac on 8/6/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        return createLabel(text: "Intruction connect to TV", font: UIFont(name: "SFCompactDisplay-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .medium), alignment: .center)
    }()
    
    private lazy var headingLabel: UILabel = {
        return createLabel(text: "How to connect your TV")
    }()
    
    private lazy var headingLabel2: UILabel = {
        return createLabel(text: "FAQs")
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var dropDownButtons: [DropDownButton] = {
        return [
            createDropDownButton(title: "1. Same Wifi for both devices", description: "Make sure your device is connected to the same Wifi network as your TV in order to connect through wifi. Check or modify the connection settings on your phone or TV \n"),
            createDropDownButton(title: "2. How to connect", description: "Open the scanning for devices section of the app and choose your device. Follow the instructions on your phone and TV to complete the pairing. You may use your phone as a remote after pairing. \n"),
            createDropDownButton(title: "1. Can't find my smart TV", description: "- Make sure your phone and TV are connected to the same wifi network \n- If your TV device can't be found, please reboot (power reset) it and try again!!! \n- Restart TV remote app/ Restart your router \n"),
            createDropDownButton(title: "2. Pin code not appearing on my Sony TV ?", description: "Enabling the renderer function. By enabling the render function, a mobile device (e.g. smartphone) can work as the TV's remote via the home network: \n- Step1: Press the home button, then select [Settings]. \n- Step2: Select [network] -> [Home network setup] -> [IP control] -> Select [Pre - Shared Key] \n"),
            createDropDownButton(title: "5. Power, Volume, Channel, Arrow Pad keys are not working but Youtube key works fine ?", description: "Setting -> Force Mode, turn on/off and try again.\n \nWe get some feedbacks from users, this app is not working on some series of BRAVIA (eg. KD-, KDL) \n")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        self.view.addSubViews([titleLabel, stackView])
        stackView.addArrangedSubview(headingLabel)
        
        stackView.addArrangedSubview(dropDownButtons[0])
        stackView.addArrangedSubview(dropDownButtons[1])
        stackView.addArrangedSubview(headingLabel2)
        stackView.addArrangedSubview(dropDownButtons[2])
        stackView.addArrangedSubview(dropDownButtons[3])
        stackView.addArrangedSubview(dropDownButtons[4])
        
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.height.equalTo(49)
            $0.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(89)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func createLabel(text: String, font: UIFont = UIFont(name: "SFCompactDisplay-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium), alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = alignment
        label.text = text
        label.font = font
        return label
    }
    
    private func createDropDownButton(title: String, description: String) -> DropDownButton {
        let button = DropDownButton()
        button.bind(title: title, description: description)
        return button
    }
}
