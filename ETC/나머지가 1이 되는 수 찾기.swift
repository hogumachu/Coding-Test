// 출처 : 프로그래머스 월간 코드 챌린지 시즌3 나머지가 1이 되는 수 찾기
// https://programmers.co.kr/learn/courses/30/lessons/87389
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int) -> Int {
    var d = n - 1
    var div = 2

    while d % div != 0 {
        div += 1
    }

    return div
}
