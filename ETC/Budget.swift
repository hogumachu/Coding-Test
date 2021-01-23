// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 예산
// https://programmers.co.kr/learn/courses/30/lessons/12982
// 풀이 : hogumachu


import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var result = 0
    var count = d.sorted().reduce(0){
        if $0 + $1 <= budget {
            result += 1
            return $0 + $1
        }
        return $0
    }

    return result
}
