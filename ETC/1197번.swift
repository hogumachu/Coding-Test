// 출처 : 백준 최소 스패닝 트리
// https://www.acmicpc.net/problem/1197
// 풀이 : hogumachu

let ve = readLine()!.split(separator: " ").map{Int(String($0))!}
var kruskal: [(Int, Int, Int)] = Array(repeating: (0, 0, 0), count: ve[1])
var result = 0
var visited = 0
var unionNum = Array(0...ve[0])

(0..<ve[1]).forEach({ index in
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    kruskal[index] = (input[0], input[1], input[2])
})
kruskal.sort{
    $0.2 < $1.2
}
kruskal.forEach({ value in
    if visited == ve[0] - 1 {
        return
    }
    if connect(value.0) != connect(value.1) {
        visited += 1
        result += value.2
        setUnion(value.0, value.1)
    }
})

print(result)

func connect(_ a: Int) -> Int {
    if unionNum[a] == a {
        return a
    } else {
        unionNum[a] = connect(unionNum[a])
        return unionNum[a]
    }
}
func setUnion(_ a: Int, _ b: Int) {
    a < b ? (unionNum[connect(b)] = unionNum[connect(a)]) : (unionNum[connect(a)] = unionNum[connect(b)])
}
