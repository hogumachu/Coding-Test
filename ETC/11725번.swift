// 출처 : 백준 트리의 부모 찾기
// https://www.acmicpc.net/problem/11725
// 풀이 : hogumachu

import Foundation

func solution() {
    let node = Int(readLine()!)!
    var tree: [[Int]] = Array(repeating: [], count: node+1)
    var parent: [Int] = Array(repeating: node+1, count: node+1)
    var visited: [Bool] = Array(repeating: false, count: node+1)
    var queue: [Int] = []
    var index = 0
    for _ in 1..<node {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        tree[value[0]].contains(value[1]) ? nil : tree[value[0]].append(value[1])
        tree[value[1]].contains(value[0]) ? nil : tree[value[1]].append(value[0])
    }

    func visitNode(_ number: Int) -> Void {
        for i in tree[number] {
            if visited[i] == false {
                visited[i] = true
                parent[i] = number
                queue.append(i)
            }
        }
    }

    for i in tree[1] {
        parent[i] = 1
        visited[i] = true
        queue.append(i)
    }
    while queue.count > index {
        visitNode(queue[index])
        index += 1
    }

    for i in 2..<parent.count {
        print(parent[i])
    }
}

solution()
