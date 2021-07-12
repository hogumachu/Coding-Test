// 출처 : 백준 집합의 표현
// https://www.acmicpc.net/problem/1717
// 풀이 : hogumachu

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
var parent: [Int] = Array(0...n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    if input[0] == 0 {
        union(input[1], input[2])
    } else {
        if getParent(input[1]) != getParent(input[2]) {
            print("NO")
        } else {
            print("YES")
        }
    }
}

func getParent(_ x: Int) -> Int{
    if parent[x] == x {
        return x
    } else {
        parent[x] = getParent(parent[x])
        return parent[x]
    }
}

func union(_ x: Int, _ y: Int) {
    let pX = getParent(x)
    let pY = getParent(y)
    if pX < pY {
        parent[pY] = pX
    } else {
        parent[pX] = pY
    }
}
