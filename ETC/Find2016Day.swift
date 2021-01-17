// 출처 : 프로그래머스 연습문제 2016년
// https://programmers.co.kr/learn/courses/30/lessons/12901
// 풀이 : hogumachu

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let day: [String] = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    var days: Int = 0
    for i in 1...a {
        if i == a {
            days += b
        } else if i < 8 {
            if i == 2{
                days += 29
            } else if i % 2 != 0 {
                days += 31
            } else if i % 2 == 0 {
                days += 30
            }
        } else if i >= 8 {
            if i == 8 && i != a {
                days = 6
            }
            else if i % 2 != 0 {
                days += 30
            } else if i % 2 == 0 {
                days += 31
            }
        }
    }
    if days%7 == 0 {
        days = 6
    } else {
        days = (days%7) - 1
    }

    return day[days]
}
