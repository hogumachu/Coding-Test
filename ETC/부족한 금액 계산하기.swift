// 출처 : 프로그래머스 위클리 챌린지 1주차
// https://programmers.co.kr/learn/courses/30/lessons/82612
// 풀이 : hogumachu

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var counting: Int64 = Int64(count) * Int64(count + 1) / 2

    answer = counting * Int64(price)

    if answer > money {
        return answer - Int64(money)
    } else {
        return 0
    }
}
