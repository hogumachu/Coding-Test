// 출처 : 백준 사이클 게임
// https://www.acmicpc.net/problem/20040
// 풀이 : hogumachu

var unionNum = Array(0..<500_000)
var result = 0
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<nm[1] {
    if result != 0 {
        _ = readLine()
    } else {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if connect(input[0]) == connect(input[1]) {
            result = i + 1
        } else {
            union(input[0], input[1])
        }
    }

}
print(result)

func connect(_ a: Int) -> Int {
    if unionNum[a] == a {
        return a
    } else {
        unionNum[a] = connect(unionNum[a])
        return unionNum[a]
    }
}

func union(_ a: Int, _ b: Int) {
    if connect(a) < connect(b) {
        unionNum[connect(b)] = unionNum[connect(a)]
    } else {
        unionNum[connect(a)] = unionNum[connect(b)]
    }
}
