// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 매칭 점수
// https://programmers.co.kr/learn/courses/30/lessons/42893
// 풀이 : hogumachu
// 틀렸음 !!!!!!!!!
// 다시 풀기
// 너무 예시에 의존하여 푼 듯
// 예외 케이스 생각해야 할 듯 !!!!

import Foundation

func solution(_ word:String, _ pages:[String]) -> Int {
    let word = word.lowercased()
    var pageDic: [String: Int] = [:]
    var pageInfo: [[String]] = Array(repeating: [], count: pages.count)
    var pageInt: [Int] = Array(repeating: 0, count: pages.count)
    var result: [Double] = Array(repeating: 0.0, count: pages.count)

    for pageIndex in 0..<pages.count {
        let enterPages = pages[pageIndex].split { $0 == "\n"}
        var counting = 0

        for i in 0..<enterPages.count {
            if enterPages[i].contains("content=") {
                let splitEnterPages = enterPages[i].split { $0 == "="}

                for splitEnterPage in splitEnterPages {
                    if splitEnterPage.contains("https://") {
                        let a = splitEnterPage.split { $0 == "\""}
                        pageDic[String(a[0])] = pageIndex
                    }
                }
            }

            if enterPages[i].contains("a href=") {
                let splitEnterPages = enterPages[i].split { $0 == "=" }

                for splitEnterPage in splitEnterPages {
                    if splitEnterPage.contains("https://") {
                        let a = splitEnterPage.split { $0 == "\""}
                        pageInfo[pageIndex].append(String(a[0]))
                    }
                }
            }

            if !(enterPages[i].contains("<") && enterPages[i].contains(">")) {

            }

            if enterPages[i].contains("<body>") {
                for k in i + 1..<enterPages.count {
                    if String(enterPages[k])[0] != "<" {
                        let str = String(enterPages[k]).lowercased()

                        if str.count - word.count > 0 {
                            for j in 0...str.count - word.count {
                                if str[j...word.count + j - 1] == word {
                                    counting += 1
                                }
                            }
                        }

                    }
                }

            }
        }
        pageInt[pageIndex] = counting
    }

    // print(pageDic)
    // print(pageInfo)
    // print(pageInt)

    for i in 0..<pages.count {
        result[i] += Double(pageInt[i])

        for info in pageInfo[i] {
            if let next = pageDic[info] {
                result[next] += Double(pageInt[i]) / Double(pageInfo[i].count)
            }
        }
    }

    let resultOffset = result.enumerated().max {
        if $0.element == $1.element {
            return $0.offset < $1.offset
        } else {
            return $0.element < $1.element
        }
    }!.offset

    return resultOffset
}

extension String {
    subscript (index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }

    subscript (indices: ClosedRange<Int>) -> String {
        return String(self[self.index(startIndex, offsetBy: indices.lowerBound)...self.index(self.startIndex, offsetBy: indices.upperBound)])
    }
}
