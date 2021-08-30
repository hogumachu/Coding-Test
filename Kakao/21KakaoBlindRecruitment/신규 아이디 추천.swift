// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 신규 아이디 추천
// https://programmers.co.kr/learn/courses/30/lessons/72410
// 풀이 : hogumachu
// 단순히 규칙대로 구현하면 되는 문제
// 다른 언어와 다르게 Swift 는 String Index 접근이 불편함
// 기존에 풀었을 때는 String 의 값들을 map 을 이용하여 배열로 만든 다음에 진행했음
// String extension 을 하여 subscript 를 이용하여 배열처럼 접근하도록 함

import Foundation

func solution(_ new_id:String) -> String {

    var newId = new_id
        // 1단계: 대문자를 소문자로 치환
        .lowercased()
        // 2단계: 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 제외 삭제
        .filter { cha in
            switch cha.asciiValue! {
            case 97...122, 48...57, 45, 46, 95:
                return true
            default:
                return false
            }
        }

    var index = 1
    var before = newId[index - 1]

    // 3단계: 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표로 치환
    while index < newId.count {
        if before == newId[index] && before == Character(".") {
            newId.remove(at: newId.index(at: index))
        } else {
            before = newId[index]
            index += 1
        }
    }

    // 4단계: 마침표가 처음에 위치하면 제거
    while !newId.isEmpty {
        if newId.first! == Character(".") {
            newId.removeFirst()
        } else {
            break
        }
    }

    // 4단계: 마침표가 끝에 위치하면 제거
    while !newId.isEmpty {
        if newId.last! == Character(".") {
            newId.removeLast()
        } else {
            break
        }
    }

    // 5단계: 빈 문자열이면 "a" 를 대입
    if newId.isEmpty {
        newId = "a"
    }

    // 6단계: 길이가 16이상이면, 15로 줄임
    if newId.count >= 16 {
        newId = newId[0...14]
    }

    // 6단계: 만약 제거 후 마침표가 끝에 위치하면 마침표 제거
    while !newId.isEmpty {
        if newId.last! == Character(".") {
            newId.removeLast()
        } else {
            break
        }
    }

    // 7단계: 길이가 2 이하라면 마지막 문자를 길이가 3이 될 때 까지 추가함
    while newId.count < 3 {
        newId += "\(newId.last!)"
    }

    return newId
}

extension String {
    // index 를 return 하는 함수
    func index(at index: Int) -> Index {
        return self.index(self.startIndex, offsetBy: index)
    }

    // String 을 배열처럼 접근하기 위한 subscript
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }

    // ClosedRange 로 String을 접근하여 Substring 이 아닌 String 으로 return
    subscript (indices: ClosedRange<Int>) -> String {
        var str = ""
        for index in indices {
            str += "\(self[index])"
        }
        return str
    }

    // Range 로 String을 접근하여 Substring 이 아닌 String 으로 return
    subscript (indices: Range<Int>) -> String {
        var str = ""
        for index in indices {
            str += "\(self[index])"
        }
        return str
    }
}
