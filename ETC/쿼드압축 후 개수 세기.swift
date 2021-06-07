// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 쿼드압축 후 개수 세기
// https://programmers.co.kr/learn/courses/30/lessons/68936
// 풀이 : hogumachu

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var zeroCount = 0
    var oneCount = 0
    let firstSize = arr.count
    func visit(_ x:Int, _ y: Int, _ size: Int) -> Void {
        let firstValue = arr[x][y]
        if size == 1 {
            if firstValue == 0 {
                zeroCount += 1
            } else {
                oneCount += 1
            }
            return
        }
        for i in x..<x+size {
            for j in y..<y+size {
                if arr[i][j] != firstValue {
                    visit(x, y, size/2)
                    visit(x, y+size/2, size/2)
                    visit(x+size/2, y, size/2)
                    visit(x+size/2, y+size/2, size/2)
                    return
                }
            }
        }
        if firstValue == 0 {
            zeroCount += 1
        } else {
            oneCount += 1
        }
        return

    }
    visit(0, 0, firstSize)
    return [zeroCount, oneCount]
}
