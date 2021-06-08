// 출처 : 프로그래머스 2021 Dev-Matching: 웹 백엔드 개발자(상반기) 행렬 테두리 회전하기
// https://programmers.co.kr/learn/courses/30/lessons/77485
// 풀이 : hogumachu

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var counting = 1
    var result: [Int] = []
    for i in 0..<rows {
        for j in 0..<columns {
            table[i][j] = counting
            counting += 1
        }
    }
    func spin(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Void {
        let save: [Int] = [table[x1][y1], table[x1][y2], table[x2][y2], table[x2][y1]]
        var minNum = min(save[0], save[1], save[2], save[3])
        for i in 0..<y2-y1-1 {
            table[x1][y2-i] = table[x1][y2-i-1]
            table[x2][y1+i] = table[x2][y1+i+1]
            if minNum > table[x2][y1+i] {
                minNum = table[x2][y1+i]
            }
            if minNum > table[x1][y2-i] {
                minNum = table[x1][y2-i]
            }
        }
        for i in 0..<x2-x1-1 {
            table[x2-i][y2] = table[x2-i-1][y2]
            table[x1+i][y1] = table[x1+i+1][y1]
            if minNum > table[x2-i][y2] {
                minNum = table[x2-i][y2]
            }
            if minNum > table[x1+i][y1] {
                minNum = table[x1+i][y1]
            }
        }
        table[x1][y1+1] = save[0]
        table[x1+1][y2] = save[1]
        table[x2][y2-1] = save[2]
        table[x2-1][y1] = save[3]
        result.append(minNum)
    }
    for query in queries {
        spin(query[0] - 1, query[1] - 1, query[2] - 1, query[3] - 1)
    }
    return result
}
