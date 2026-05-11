package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
	e := exp(n)
	sum := u128(0)
	num := n
	for i in 0 ..< e {
		divisor := power(10, e - i - 1)
		rem := num % divisor
		num /= divisor
		if i == e {
			sum += power(rem, e)
		} else {
			sum += power(num, e)
		}
		num = rem
	}
	return sum == n
}

exp :: proc(n: u128) -> int {
	exp := 0
	base := n
	for base > 0 {
		base /= 10
		exp += 1
	}
	return exp
}

power :: proc(n: u128, exp: int) -> u128 {
	if exp <= 0 {
		return 1
	}

	sum := n
	for i := 2; i <= exp; i += 1 {
		sum *= n
	}
	return sum
}
