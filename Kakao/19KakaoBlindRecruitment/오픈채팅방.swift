// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 오픈채팅방
// https://programmers.co.kr/learn/courses/30/lessons/42888
// 풀이 : hogumachu

import Foundation

func solution(_ record:[String]) -> [String] {
    var user = [String:String]()
    var orders: [(String, String)] = []
    var result: [String] = []
    for i in record {
        let value = i.split(separator: " ").map{String($0)}
        if value[0] == "Enter" {
            user[value[1]] = value[2]
            orders.append((value[0], value[1]))
        } else if value[0] == "Leave" {
            orders.append((value[0], value[1]))
        } else if value[0] == "Change" {
            user[value[1]] = value[2]
        }
    }

    for order in orders {
        if order.0 == "Enter" {
            result.append("\(user[order.1]!)님이 들어왔습니다.")
        } else if order.0 == "Leave" {
            result.append("\(user[order.1]!)님이 나갔습니다.")
        }
    }

    return result
}
