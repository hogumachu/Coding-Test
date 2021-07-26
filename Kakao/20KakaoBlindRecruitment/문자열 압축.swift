// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 문자열 압축
// https://programmers.co.kr/learn/courses/30/lessons/60057
// 풀이 : hogumachu

import Foundation

func solution(_ str:String) -> Int {
    var s = str.map { String($0) }
    var compareSize = s.count / 2 - 1
    var now = ""
    var nowCount = 1
    var index = 0
    var result = ""
    var resultCount = s.count


    while compareSize >= 0 {
        if index + compareSize >= s.count {
            if nowCount != 1 {
                result += "\(nowCount)"
            }
            result += now
            result += s[index..<s.count].joined(separator: "")
            resultCount = resultCount > result.count ? result.count : resultCount
            result = ""
            compareSize -= 1
            index = 0
            now = ""
            nowCount = 1
        } else {
            let compare = s[index...index + compareSize].joined(separator: "")
            if now == compare {
                nowCount += 1
            } else {
                if nowCount != 1 {
                    result += "\(nowCount)"
                }
                result += now
                nowCount = 1
            }
            now = compare
            index += compareSize + 1
        }
    }

    return resultCount
}
