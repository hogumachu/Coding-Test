// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 방문 길이
// https://programmers.co.kr/learn/courses/30/lessons/49994
// 풀이 : hogumachu

import Foundation

func solution(_ dirs: String) -> Int {
    var visited: [String: Bool] = [:]
    var result = 0
    var now: (x: Int, y: Int) = (0, 0)

    for i in dirs.map { String($0) } {
        switch i {
        case "U":
            if now.y + 1 <= 5 {
                if visited["\(now.x), \(now.y) - \(now.x), \(now.y + 1)"] == nil {
                    visited["\(now.x), \(now.y) - \(now.x), \(now.y + 1)"] = true
                    result += 1
                }
                now.y += 1
            }
        case "D":
            if now.y - 1 >= -5 {
                if visited["\(now.x), \(now.y - 1) - \(now.x), \(now.y)"] == nil {
                    visited["\(now.x), \(now.y - 1) - \(now.x), \(now.y)"] = true
                    result += 1
                }
                now.y -= 1
            }
        case "R":
            if now.x + 1 <= 5 {
                if visited["\(now.x), \(now.y) - \(now.x + 1), \(now.y)"] == nil {
                    visited["\(now.x), \(now.y) - \(now.x + 1), \(now.y)"] = true
                    result += 1
                }
                now.x += 1
            }
        case "L":
            if now.x - 1 >= -5 {
                if visited["\(now.x - 1), \(now.y) - \(now.x), \(now.y)"] == nil {
                    visited["\(now.x - 1), \(now.y) - \(now.x), \(now.y)"] = true
                    result += 1
                }
                now.x -= 1
            }
        default:
            break
        }
    }

    return result
}
