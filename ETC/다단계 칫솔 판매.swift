// 출처 : 프로그래머스 2021 Dev-Matching: 웹 백엔드 개발자(상반기) 다단계 칫솔 판매
// https://school.programmers.co.kr/learn/courses/30/lessons/77486
// 풀이 : hogumachu

import Foundation

func solution(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    var indexDictionary: [String: Int] = [:]
    var result = Array(repeating: 0, count: enroll.count)
    
    for i in 0..<enroll.count {
        indexDictionary[enroll[i]] = i
    }
    
    func doThatShit(_ index: Int, pay: Int) {
        let div = pay / 10
        result[index] += pay - div
        
        if div == 0 || referral[index] == "-" {
            return
        }
        
        doThatShit(indexDictionary[referral[index]]!, pay: div)
    }
    
    for i in 0..<seller.count {
        let seller = seller[i]
        let pay = amount[i] * 100
        let div = pay / 10
        
        let index = indexDictionary[seller]!
        result[index] += pay - div
        let next = referral[index]
        if next != "-" && div != 0 {
            let nextIndex = indexDictionary[next]!
            doThatShit(nextIndex, pay: div)
        }
    }
    
    
    return result
}
