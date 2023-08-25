//
//  ViewController.swift
//  GangNamRoad+MVVM
//
//  Created by mobile on 2023/02/10.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {

    //MARK: - Propeties
    let safeArea = UIView()
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setUpNavigationBar()
        refreshData()
    }
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configures
    func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(safeArea)
        title = viewModel.title

        safeArea.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .gray
        view.backgroundColor = .white

        let rightButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(tapAddWidgetPage))
        self.navigationItem.rightBarButtonItem = rightButton

        navigationItem.rightBarButtonItem = rightButton
    }
    
    //MARK: - Helpers
    @objc func tapAddWidgetPage() {
        print(#function)
        let registerWidgetViewController = RegisterWidgetViewController()
        self.navigationController?.pushViewController(registerWidgetViewController, animated: true)
    }
    
    func refreshData() {
        viewModel.fetchWeather().subscribe(onNext: { fetchedWeatherData in
            var iconCode = fetchedWeatherData.current.weather[0].icon
            
            print("timezone: \(fetchedWeatherData.timezone)")
            print("iconUrl: https://openweathermap.org/img/wn/\(iconCode)@2x.png")
            print("temp: \(fetchedWeatherData.current.temp!)")
        })
    }
}

