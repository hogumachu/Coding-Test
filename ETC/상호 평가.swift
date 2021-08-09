// 출처 : 프로그래머스 위클리 챌린지 2주차
// https://programmers.co.kr/learn/courses/30/lessons/83201
// 풀이 : hogumachu

import Foundation

func solution(_ scores:[[Int]]) -> String {
    var result = ""
    for i in 0..<scores.count {
        var lowerCount = 0
        var upperCount = 0
        var equalCount = 0

        for j in 0..<scores[i].count {
            if i != j {
                if scores[j][i] < scores[i][i] {
                    lowerCount += scores[j][i]
                } else if scores[j][i] > scores[i][i] {
                    upperCount += scores[j][i]
                } else {
                    equalCount += scores[j][i]
                }
            }
        }

        if (lowerCount != 0 && upperCount == 0 && equalCount == 0) || (lowerCount == 0 && upperCount != 0 && equalCount == 0) || (lowerCount == 0 && upperCount == 0 && equalCount != 0) {
            result += stringScore((lowerCount + upperCount + equalCount)  / (scores[i].count - 1))
        } else {
            result += stringScore((lowerCount + upperCount + equalCount + scores[i][i]) / scores[i].count)
        }
    }
    return result
}

func stringScore(_ value: Int) -> String {
    switch value {
    case (90...100):
        return "A"
    case (80..<90):
        return "B"
    case (70..<80):
        return "C"
    case (50..<70):
        return "D"
    default:
        return "F"
    }
}
