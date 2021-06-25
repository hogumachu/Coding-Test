// 출처 : 백준 30
// https://www.acmicpc.net/problem/10610
// 풀이 : hogumachu

let n = readLine()!.map{Int(String($0))!}.sorted(by: >)
var result = ""
if n[n.count - 1] == 0 && n.reduce(0, +) % 3 == 0 {
    for i in n {
        result += String(i)
    }
    print(result)
} else {
    print(-1)
}
