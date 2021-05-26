// 출처 : 백준 치킨 배달
// https://www.acmicpc.net/problem/15686
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var homeLocation: [(Int, Int)] = []
    var chickenLocation: [(Int, Int)] = []
    var result = 100000000
    for i in 0..<n {
        let values = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<values.count {
            if values[j] == 1 {
                homeLocation.append((i, j))
            } else if values[j] == 2 {
                chickenLocation.append((i, j))
            }
        }
    }
    var homeToChicken: [[Int]] = Array(repeating: Array(repeating: 0, count: chickenLocation.count), count: homeLocation.count)

    for i in 0..<homeLocation.count {
        for j in 0..<chickenLocation.count {
            homeToChicken[i][j] = abs(homeLocation[i].0 - chickenLocation[j].0) + abs(homeLocation[i].1 - chickenLocation[j].1)
        }
    }
    func removeChicken(_ canVisit: [Int], _ canVisitIndex: Int, _ counting: Int) -> Void {
        if counting > m {
            return
        }
        if counting <= m {
            var sum = 0
            for i in 0..<homeLocation.count {
                var min = 10000000
                for j in canVisit {
                    if min > homeToChicken[i][j] {
                        min = homeToChicken[i][j]
                    }
                }
                sum += min
            }

            if result > sum {
                result = sum
            }
        }

        if canVisitIndex == chickenLocation.count {
            return
        }
        for i in canVisitIndex..<chickenLocation.count {
            var newCanVisit = canVisit
            newCanVisit.append(i)
            removeChicken(newCanVisit, i+1, counting+1)
        }

    }
    for i in 0..<chickenLocation.count {
        removeChicken([i], i+1, 1)
    }

    print(result)
}

solution()
