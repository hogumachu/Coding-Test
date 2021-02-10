// 출처 : 백준 문자열 분석
// https://www.acmicpc.net/problem/10820
// 풀이 : hogumachu

while let input = readLine() {
    var result: [Int] = [0, 0, 0, 0]
    for i in input {
        let ascii = Int(i.asciiValue!)
        if ascii >= 97 && ascii <= 122 {
            result[0] += 1
        } else if ascii >= 65 && ascii <= 90 {
            result[1] += 1
        } else if ascii >= 48 && ascii <= 57 {
            result[2] += 1
        } else if ascii == 32 {
            result[3] += 1
        }
    }
    print("\(result[0]) \(result[1]) \(result[2]) \(result[3])")
}
