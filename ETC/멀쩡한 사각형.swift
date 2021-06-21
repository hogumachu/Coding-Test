// 출처 : 프로그래머스 Summer/Winter Coding(2019) 멀쩡한 사각형
// https://programmers.co.kr/learn/courses/30/lessons/62048
// 풀이 : hogumachu

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var minusValue = 0
    var small = w
    var big = h

    let gcd = GCD(w, h)
    small = w / gcd
    big = h / gcd
    if small > big {
        let saveSmall = small
        small = big
        big = saveSmall
    }
    var before = Double(0)
    for i in 1...big {
        let div = Double(small) / Double(big) * Double(i)
        if div - Double(Int(small * i / big)) == 0 {
            minusValue += 1
        } else if Int(div) - Int(before) == 0 {
            minusValue += 1
        } else {
            minusValue += 2
        }
        before = div
    }
    if w > h {
        minusValue *= (w / big)
    } else {
        minusValue *= (w / small)
    }
    answer = Int64(w) * Int64(h) - Int64(minusValue)
    return answer
}

func GCD(_ a: Int, _ b: Int) -> Int {
    var gcd = 1
    var mult = 2
    while a >= gcd && b >= gcd && mult <= a {
        if a % (gcd * mult) == 0 && b % (gcd * mult) == 0{
            gcd *= mult
        } else {
            mult += 1
        }
    }
    return gcd
}
