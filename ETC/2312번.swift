// 출처 : 백준 수 복원하기
// https://www.acmicpc.net/problem/2312
// 풀이 : hogumachu

let tc = Int(readLine()!)!

for _ in 0..<tc {
    var n = Int(readLine()!)!
    var result: [String] = []
    for i in 2...n {
        let dived = div(n, i)
        if dived[1] != 0 {
            n = dived[0]
            result.append("\(i) \(dived[1])")
        }
        if n == 0 {
            break
        }
    }
    result.forEach({
        print($0)
    })
}

func div(_ num: Int, _ divisor: Int) -> [Int] {
    var divedNum = num
    var counting = 0
    while divedNum % divisor == 0 && divedNum != 0{
        divedNum /= divisor
        counting += 1
    }
    return [divedNum, counting]
}
