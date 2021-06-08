// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [3차] n진수 게임
// https://programmers.co.kr/learn/courses/30/lessons/17687
// 풀이 : hogumachu

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result = ""
    var counting = 0
    var peopleNum = 1
    for i in 0...t*m {
        let numbers = String(i, radix: n)
        for number in numbers {
            if peopleNum == p {
                if number == Character("a") {
                    result += "A"
                } else if number == Character("b") {
                    result += "B"
                } else if number == Character("c") {
                    result += "C"
                } else if number == Character("d") {
                    result += "D"
                } else if number == Character("e") {
                    result += "E"
                } else if number == Character("f") {
                    result += "F"
                } else {
                    result += "\(number)"
                }

                counting += 1
                if counting == t {
                    return result
                }
            }
            peopleNum += 1
            if peopleNum > m {
                peopleNum = 1
            }

        }
    }

    return result
}
