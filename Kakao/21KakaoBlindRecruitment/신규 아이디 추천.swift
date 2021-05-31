// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 신규 아이디 추천
// https://programmers.co.kr/learn/courses/30/lessons/72410
// 풀이 : hogumachu



import Foundation

func solution(_ new_id:String) -> String {
    var id: [Character] = []
    var beforeCharacter: Character = Character(" ")
    for c in new_id {
        if c.asciiValue! >= 65 && c.asciiValue! <= 90 {
            id.append(Character(UnicodeScalar(c.asciiValue!+32)))
            beforeCharacter = Character(UnicodeScalar(c.asciiValue!+32))
        } else if c.asciiValue! >= 97 && c.asciiValue! <= 122 {
            id.append(c)
            beforeCharacter = c
        } else if c == Character("-") || c == Character("_") || c == Character(".") {
            if !(beforeCharacter == Character(".") && c == Character(".")) {
                id.append(c)
                beforeCharacter = c
            }
        } else if c == Character("0") || c == Character("1") || c == Character("2") || c == Character("3") || c == Character("4") || c == Character("5") || c == Character("6") || c == Character("7") || c == Character("8") || c == Character("9") {
            id.append(c)
            beforeCharacter = c
        }
    }
    while id.first == Character(".") {
        id.removeFirst()
    }
    while id.last == Character(".") {
        id.removeLast()
    }
    if id.count >= 16 {
        for _ in 15..<id.count {
            id.removeLast()
        }
    }
    while id.last == Character(".") {
        id.removeLast()
    }
    if id.count == 0 {
        id.append(Character("a"))
    }
    if id.count <= 2 && id.count != 0 {
        let addWord = id.last!
        while id.count != 3 {
            id.append(addWord)
        }
    }
    var result = ""
    for i in id {
        result += "\(i)"
    }
    return result
}
