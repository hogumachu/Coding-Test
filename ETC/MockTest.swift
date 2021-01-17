// 출처 : 프로그래머스 완전탐색 모의고사
// https://programmers.co.kr/learn/courses/30/lessons/42840
// 풀이 : hogumachu 

import Foundation

func solution(_ answers:[Int]) -> [Int] {

    var firstMan: Int = 0
    var secondMan: Int = 0
    var thirdMan: Int = 0

    var firstResult: Int = 0
    var secondResult: Int = 0
    var thirdResult: Int = 0

    let first: [Int] = [1,2,3,4,5]
    let second: [Int] = [2,1,2,3,2,4,2,5]
    let third: [Int] = [3,3,1,1,2,2,4,4,5,5]

    var result: [Int] = []

    for i in answers {
        if firstMan == first.count {
            firstMan = 0
        }
        if secondMan == second.count {
            secondMan = 0
        }
        if thirdMan == third.count {
            thirdMan = 0
        }
        if first[firstMan] == i {
            firstResult += 1
        }
        if second[secondMan] == i {
            secondResult += 1
        }
        if third[thirdMan] == i {
            thirdResult += 1
        }
        firstMan += 1
        secondMan += 1
        thirdMan += 1
    }
    if firstResult > secondResult { // f > s
        if firstResult > thirdResult { // f > s, t
            result.append(1)
        } else if firstResult < thirdResult{ // t > f > s
            result.append(3)
        } else { // f = t > s
            result.append(1)
            result.append(3)
        }
    } else if firstResult < secondResult { // f < s
        if secondResult < thirdResult { // f < s < t
            result.append(3)
        } else if secondResult > thirdResult { // f < t < s
            result.append(2)
        } else { // s = t
            result.append(2)
            result.append(3)
        }
    } else { // f = s
        if firstResult > thirdResult { // f = s > t
            result.append(1)
            result.append(2)
        } else if firstResult < thirdResult{ // t > f = s
            result.append(3)
        } else { // f = s = t
            result.append(1)
            result.append(2)
            result.append(3)
        }
    }


    return result
}
