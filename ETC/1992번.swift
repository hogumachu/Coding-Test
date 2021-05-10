// 출처 : 백준 쿼드트리
// https://www.acmicpc.net/problem/1992
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: [], count: n)
    var result = ""
    for i in 0..<n {
        let value = readLine()!.map{Int(String($0))!}
        table[i] = value
    }

    func quadTree(size n: Int, startX x: Int, startY y: Int, compare: String ) -> Void {
        if compare == "left" {
            result += "("
        }
        if n == 1 {
            result += "\(table[x][y])"
        } else {
            let start = table[x][y]
            for i in x..<x+n {
                for j in y..<y+n {
                    if table[i][j] != start {
                        quadTree(size: n/2, startX: x, startY: y, compare: "left")
                        quadTree(size: n/2, startX: x, startY: y+n/2, compare: "")
                        quadTree(size: n/2, startX: x+n/2, startY: y, compare: "")
                        quadTree(size: n/2, startX: x+n/2, startY: y+n/2, compare: "right")
                        if compare == "right" {
                            result += ")"
                        }
                        return
                    }
                }
            }
            result += "\(start)"
        }
        if compare == "right" {
            result += ")"
        }
    }
    quadTree(size: n, startX: 0, startY: 0, compare: "")
    print(result)
}

solution()
