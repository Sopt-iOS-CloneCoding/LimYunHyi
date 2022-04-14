//
//  WorldClockViewController.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import UIKit

class WorldClockViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var cityClocks: [CityClock] = [] {
        didSet{
            //ADD 도시 추가 기능 구현 시 구현 예정
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //FIX 정리 필요
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //FIX 임시 데이터
        let date = Date()
        cityClocks.append(CityClock(cityName: "서울", time: date))
    }
}

extension WorldClockViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityClocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorldClockTableViewCell", for: indexPath) as? WorldClockTableViewCell else {return UITableViewCell()}
        
        //FIX 임시 데이터 연결
        let city = cityClocks[indexPath.row]
        cell.cityLabel.text = city.cityName
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.identifier)
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        formatter.dateFormat = "HH:mm"
        cell.timeLabel.text = formatter.string(from: city.time)
        cell.timeSlotLabel.text = "오후"
        cell.timeDifferenceLabel.text = "+0시간"
        
        return cell
    }
}

extension WorldClockViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
