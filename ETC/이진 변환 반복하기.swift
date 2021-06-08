// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 이진 변환 반복하기
// https://programmers.co.kr/learn/courses/30/lessons/70129
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> [Int] {
    var zeroCount = 0
    var funcCount = 0
    func binaryChange(_ value: String) -> Void {
        var oneCount = 0
        if value == "1" {
            return
        } else {
            funcCount += 1
        }
        for v in value {
            if v == "0" {
                zeroCount += 1
            } else {
                oneCount += 1
            }
        }
        var binaryStr = ""
        while oneCount > 0 {
            binaryStr = "\(oneCount % 2)" + binaryStr
            oneCount /= 2
        }
        binaryChange(binaryStr)
    }
    binaryChange(s)
    return [funcCount, zeroCount]
}
