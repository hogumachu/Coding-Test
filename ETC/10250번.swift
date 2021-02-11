// 출처 : 백준 ACM 호텔
// https://www.acmicpc.net/problem/10250
// 풀이 : hogumachu

let input = Int(readLine()!)!
var result: [String] = []

for _ in 0..<input {
    let value = readLine()!.split(separator: " ").map{Int($0)!}
    let H: Int = value[2] / value[0]
    let W: Int = value[2] % value[0]

    if W == 0 {
        if H < 10 {
            result.append("\(value[0])0\(H)")
        } else {
            result.append("\(value[0])\(H)")
        }
    } else {
        if H < 9 {
            result.append("\(W)0\(H+1)")
        } else {
            result.append("\(W)\(H+1)")
        }
    }
}

for i in result {
    print(i)
}
