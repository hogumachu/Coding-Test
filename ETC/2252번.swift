// 출처 : 백준 줄 세우기
// https://www.acmicpc.net/problem/2252
// 풀이 : hogumachu

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var graph: [[Int]] = Array(repeating: [], count: nm[0] + 1)
var priority: [Int] = Array(repeating: 0, count: nm[0] + 1)
var queue: [Int] = []
var queueIndex = 0
var result = ""
for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
    priority[input[1]] += 1
}

for i in 1..<priority.count {
    if priority[i] == 0 {
        queue.append(i)
    }
}

while queue.count > queueIndex {
    let select = queue[queueIndex]
    queueIndex += 1
    result += "\(select) "
    graph[select].forEach({ value in
        priority[value] -= 1
        if priority[value] == 0 {
            queue.append(value)
        }
    })
}

print(result)
