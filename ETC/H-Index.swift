// 출처 : 프로그래머스 정렬 H-Index
// https://programmers.co.kr/learn/courses/30/lessons/42747
// 풀이 : hogumachu

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedArray = citations.sorted()
    var result = 0
    for i in 0..<sortedArray.count {
        if sortedArray[i] == 0 {
            continue
        } else {
            if sortedArray[i] > result {
                 for j in result...sortedArray[i] {
                     if j <= sortedArray.count - i {
                        if result < j {
                            result = j
                        }
                     } else {
                         break
                     }
                 }
            }

        }
    }
    return result
}
