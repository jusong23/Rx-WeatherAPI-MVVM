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

        let rightButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(getData))
        self.navigationItem.rightBarButtonItem = rightButton

        navigationItem.rightBarButtonItem = rightButton
    }
    
    //MARK: - Helpers
    @objc func getData() {
        viewModel.fetchWeather().subscribe(onNext: { fetchedWeatherData in
            print(fetchedWeatherData)
        })
    }
}

