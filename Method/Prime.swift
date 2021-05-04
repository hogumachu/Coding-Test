// 에라토스테네스의 체의 방식으로 Int에 Int.prime으로 prime인지 아닌지 확인 가능

extension Int{
    var prime: Bool {
        var primes: [Bool] = Array(repeating: true, count: self+1)

        primes[0] = false
        primes[1] = false

        if self > 3 {
            for index in 2...primes.count-1 {
                var compare = 2
                while compare * index <= self {
                    primes[compare * index] = false
                    compare += 1
                }
                if compare * index == self {
                    break
                }
            }
        }
        return primes[self]
    }
}
