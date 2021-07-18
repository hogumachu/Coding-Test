// 출처 : 백준 CCW
// https://www.acmicpc.net/problem/11758
// 풀이 : hogumachu

let p1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let p2 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let p3 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let result = p1[0] * p2[1] + p2[0] * p3[1] + p3[0] * p1[1] - (p2[0] * p1[1] + p3[0] * p2[1] + p1[0] * p3[1])

if result > 0 {
    print(1)
} else if result < 0 {
    print(-1)
} else {
    print(0)
}
