// 출처 : 백준 이분 그래프
// https://www.acmicpc.net/problem/1707
// 풀이 : hogumachu

let tc = Int(readLine()!)!
// test case 2 ~ 5
for _ in 0 ..< tc {
    let ve = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let v = ve[0], e = ve[1]
//    (1 <= v <= 20_000), (1 <= e <= 200_000)
    var graph: [[Int]] = Array(repeating: [], count: v + 1)
    var compare: [Int8] = Array(repeating: 0, count: v + 1)
    var queue: [Int] = []
    var queueIndex = 0
    var result = true


    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }

    for i in 1...v {
        if result == false {
            break
        } else if compare[i] == 0 {
            queue.append(i)
            compare[i] = 1
            while queue.count > queueIndex {
                let select = queue[queueIndex]
                queueIndex += 1
                visit(select, compare[select])
            }
        }
    }

    print(result == true ? "YES" : "NO")
    func visit(_ node: Int, _ value: Int8) {
        for i in 0..<graph[node].count {
            if compare[graph[node][i]] == 0 {
                compare[graph[node][i]] = -value
                queue.append(graph[node][i])
            } else if compare[graph[node][i]] == value {
                result = false
                return
            }
        }
    }
}
