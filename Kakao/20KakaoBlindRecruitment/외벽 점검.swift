// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 외벽 점검
// https://programmers.co.kr/learn/courses/30/lessons/60062
// 풀이 : hogumachu

// 시간 초과 났음 !!!

// 시간 초과 났음 !!!

// 다시 풀어 보기

// TC 13, 14 시간 초과

// 재귀 반복을 너무 많이 하는 듯??????

import Foundation

func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
    var result = Int.max
    let visited = Array(repeating: false, count: weak.count)

    func visit(_ visited: [Bool], _ now: Int, _ count: Int, _ compare: Int) {

        if count == weak.count {
            result = min(result, compare)
            return
        }

        if result <= compare || now < 0{
            return
        }

        for i in 0..<weak.count {
            if !visited[i] {
                var newVisit = visited
                newVisit[i] = true
                var visitCount = count + 1
                var j = i
                var value = dist[now]

                while !newVisit[(j + 1) % weak.count] {
                    let d = (j + 1) % weak.count == 0 ? weak[0] + (n - weak[weak.count - 1]) : weak[(j + 1) % weak.count] - weak[j % weak.count]
                    if value >= d {
                        value -= d
                        newVisit[(j + 1) % weak.count] = true
                        visitCount += 1
                    } else {
                        break
                    }
                    j += 1
                }
                visit(newVisit, now - 1, visitCount, compare + 1)
            }

        }
    }

    visit(visited, dist.count - 1, 0, 0)

    return result == Int.max ? -1 : result
}
