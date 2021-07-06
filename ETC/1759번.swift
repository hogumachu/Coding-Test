// 출처 : 백준 암호 만들기
// https://www.acmicpc.net/problem/1759
// 풀이 : hogumachu

let lc = readLine()!.split(separator: " ").map{Int(String($0))!}
var alphabets = readLine()!.split(separator: " ").sorted()

for i in 0..<lc[1] {
    switch alphabets[i]{
    case "a", "e", "i", "o", "u":
        visit(1, 0, [i], i + 1)
    default:
        visit(0, 1, [i],  i + 1)
    }
}


func visit(_ vowel: Int, _ consonant: Int, _ indices: [Int], _ now: Int) {
    if vowel + consonant == lc[0] {
        if vowel >= 1 && consonant >= 2 {
            var result = ""
            indices.forEach({
                result += alphabets[$0]
            })
            print(result)
        }
        return
    }
    if now == lc[1] {
        return
    }
    for i in now..<lc[1] {
        if !indices.contains(i) {
            switch alphabets[i]{
            case "a", "e", "i", "o", "u":
                visit(vowel + 1, consonant, indices + [i], i + 1)
            default:
                visit(vowel, consonant + 1, indices + [i], i + 1)
            }
        }
    }
}
