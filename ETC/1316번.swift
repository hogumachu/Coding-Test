// 출처 : 백준 그룹 단어 체커
// https://www.acmicpc.net/problem/1316
// 풀이 : hogumachu

let input = Int(readLine()!)!
var result: Int = 0

for i in 1...input {
    let input2 = readLine()!
    var array: [Character] = []
    var beforCharacter: Character = " "
    for c in input2 {
        if array.contains(c) == true {
            if beforCharacter != c {
                result -= 1
                break
            }
        } else {
            array.append(c)
            beforCharacter = c
        }
    }

    result += 1
}

print(result)
