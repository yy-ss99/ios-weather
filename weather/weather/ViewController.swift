//
//  ViewController.swift
//  weather
//
//  Created by Yeseul Jang on 2023/10/17.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureMainScrollView()
        configureMainStackView()
    }
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self,
                                                            action: #selector(tapEditButton))
        navigationItem.title = "오늘의 날씨"
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    @objc func tapEditButton() {
    }
    
    func configureMainScrollView() {
        // 오늘 날씨 숫자 - 현재 온도
        // 오늘 날씨 그림 - 이모지
        // 시간대 별 날씨 - 가로 스크롤 뷰
        // 일주일 날씨 - 세로 스크롤 뷰
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        //스크롤뷰는 맞춰줌
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //contentView.backgroundColor = .blue
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor)
        ])
    }
    
    func configureMainStackView() {
        let mainStackView = UIStackView()
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 5
        mainStackView.alignment = .center
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let todayWeatherEmojiLabel = UILabel()
        todayWeatherEmojiLabel.text = "☀️"
        todayWeatherEmojiLabel.numberOfLines = 0
        todayWeatherEmojiLabel.font = .systemFont(ofSize: 150)
        
        mainStackView.addArrangedSubview(todayWeatherEmojiLabel)
        
        let todayWeatherTemperatureLabel = UILabel()
        todayWeatherTemperatureLabel.text = "오늘은 23 ℃ 입니다! "
        todayWeatherTemperatureLabel.font = .preferredFont(forTextStyle: .largeTitle)
        todayWeatherTemperatureLabel.textColor = .darkGray
        
        mainStackView.addArrangedSubview(todayWeatherTemperatureLabel)
    }
}

