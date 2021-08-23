// 출처 : 프로그래머스 위클리 챌린지 4주차
// https://programmers.co.kr/learn/courses/30/lessons/84325
// 풀이 : hogumachu

import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var result = ""
    var maxSum = 0

    for value in table {
        let arr = value.split { $0 == " "}.map{ String($0) }
        var sum = 0

        for i in 0..<languages.count {
            if arr.contains(languages[i]) {
                let index = arr.firstIndex(of: languages[i])!
                sum += (6 - index) * preference[i]
            }
        }

        if sum > maxSum {
            result = arr[0]
            maxSum = sum
        } else if sum == maxSum {
            if result > arr[0] {
                result = arr[0]
            }
        }
    }

    return result
}
