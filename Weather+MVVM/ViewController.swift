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
import WidgetKit

class ViewController: UIViewController {

    //MARK: - Propeties
    let safeArea = UIView()
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel

    let iconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "globe.americas")
        view.contentMode = .scaleAspectFit
        return view
    }()
    let lblTimezone = UILabel()
    let lblTemp = UILabel()
    let lblLastestUpdateTime = UILabel()


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

        [iconImage, lblTimezone, lblTemp, lblLastestUpdateTime].forEach {
            view.addSubview($0)
        }

        safeArea.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        iconImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(25)
            make.width.height.equalTo(50)
        }

        lblTimezone.text = "Timezone"
        lblTimezone.textColor = .black
        lblTimezone.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        lblTimezone.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.top).inset(50)
            make.leading.equalTo(iconImage.snp.leading)
        }

        lblTemp.text = "Temp"
        lblTemp.textColor = .black
        lblTemp.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lblTemp.snp.makeConstraints { make in
            make.top.equalTo(lblTimezone.snp.top).inset(25)
            make.leading.equalTo(lblTimezone.snp.leading)
        }

        lblLastestUpdateTime.text = "최근 업데이트 시각: 13:29:33"
        lblLastestUpdateTime.textColor = .darkGray
        lblLastestUpdateTime.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblLastestUpdateTime.snp.makeConstraints { make in
            make.top.equalTo(lblTemp.snp.top).inset(25)
            make.leading.equalTo(lblTemp.snp.leading)
        }
    }

    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .gray
        view.backgroundColor = .white

        let rightButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(tapAddWidgetPage))

        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(loadData))

        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
    }

    //MARK: - Helpers
    @objc func tapAddWidgetPage() {
        print(#function)
        let registerWidgetViewController = RegisterWidgetViewController()
        self.navigationController?.pushViewController(registerWidgetViewController, animated: true)
    }

    /// 위젯에서 요청할 함수
    /// 여기서 받아서 -> 위젯으로 전달
    @objc func loadData() {
        viewModel.fetchWeather().subscribe(onNext: { fetchedWeatherData in
            var iconCode = fetchedWeatherData.current.weather[0].icon
            var iconUrl = URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")!

            var timezone = fetchedWeatherData.timezone
            var temp = fetchedWeatherData.current.temp!
            var updateTime = getNowTime()

            self.updateDataOnWidget(iconCode, timezone, temp, updateTime)
            self.updateDataonApp(iconUrl, timezone, temp)
        })
    }

    func updateDataOnWidget(_ iconCode: String, _ timezone: String, _ temp: Double, _ updateTime: String) {
        WidgetData.write(iconCode, timezone, temp, updateTime)
        WidgetCenter.shared.reloadAllTimelines()
    }

    func updateDataonApp(_ iconUrl: URL, _ timeZone: String, _ temp: Double) {
        DispatchQueue.main.async {
            print(iconUrl)
            self.iconImage.load(url: iconUrl)
            self.lblTimezone.text = timeZone
            self.lblTemp.text = String(format: "%.1f", (temp)) + "℃"
            self.lblLastestUpdateTime.text = "최근 업데이트 시각: \(getNowTime())"
        }
    }
}

#if DEBUG
    import SwiftUI
    import WidgetKit
    struct ViewControllerRepresentable: UIViewControllerRepresentable {
        func updateUIViewController(_: UIViewController, context _: Context) {
            // leave this empty
        }

        @available(iOS 13.0.0, *)
        func makeUIViewController(context _: Context) -> UIViewController {
            ViewController(viewModel: RootViewModel(weatherService: WeatherService()))
        }
    }

    @available(iOS 13.0, *)
    struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
        static var previews: some View {
            Group {
                ViewControllerRepresentable()
                    .ignoresSafeArea()
                    .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                    .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            }
        }
    }#endif

