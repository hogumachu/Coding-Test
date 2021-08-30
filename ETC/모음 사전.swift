// 출처 : 프로그래머스 위클리 챌린지 5주차
// https://programmers.co.kr/learn/courses/30/lessons/84512
// 풀이 : hogumachu
// 단순한 재귀 문제
import Foundation

func solution(_ word:String) -> Int {
    // 사전 검색을 위한 Dictionry
    var dict: [String: Int] = [:]
    // 사전에 넣을 값 (사전에서 몇 번째 단어인지에 대한 값)
    var count = 1
    // 사전에 넣을 알파벳
    let alphabet = ["A", "E", "I", "O", "U"]

    // dict 를 추가하는 함수
    func makeDictionary(_ str: String) {
        // 최대 5개 까지이므로 str 이 5개가 되면 return
        // 5개에서 추가로 반복문이 시작되면 6개 길이의 단어가 추가되기 때문
        if str.count == 6 {
            return
        }

        // 사전에 값을 추가하고 makeDictionry 를 다시 실행
        for i in 0..<alphabet.count {
            dict[str + alphabet[i]] = count
            count += 1
            makeDictionary(str + alphabet[i])
        }
    }

    // 초기 실행
    for i in 0..<alphabet.count {
        dict[alphabet[i]] = count
        count += 1
        makeDictionary(alphabet[i])
    }

    return dict[word]!
}
