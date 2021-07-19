// 출처 : 백준 최대공약수
// https://www.acmicpc.net/problem/1850
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var result = ""

for _ in 0..<gcd(input[0], input[1]) {
    result += "1"
}

print(result)

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}
