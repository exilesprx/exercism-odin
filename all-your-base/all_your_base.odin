package all_your_base

import "core:slice"

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	if input_base < 2 {
		return []int{}, .Input_Base_Too_Small
	}
	if output_base < 2 {
		return []int{}, .Output_Base_Too_Small
	}

	number, error := to_number(digits, input_base)
	if error != .None {
		return []int{}, error
	}

	positional_notation := to_positional_notation(number, output_base)
	return positional_notation, .None
}

power :: proc(base, exp: int) -> int {
	result := 1
	b := base
	e := exp
	for e > 0 {
		if e % 2 == 1 {
			result *= b
		}
		b *= b
		e /= 2
	}

	return result
}

to_number :: proc(digits: []int, input_base: int) -> (int, Error) {
	number := 0
	for digit, i in digits {
		if digit < 0 || digit >= input_base {
			return number, .Invalid_Input_Digit
		}
		exp := len(digits) - 1 - i
		number += digit * power(input_base, exp)
	}

	return number, .None
}

to_positional_notation :: proc(number, output_base: int) -> []int {
	positional_notation := make([dynamic]int)
	n := number
	for n > 0 {
		append(&positional_notation, n % output_base)
		n /= output_base
	}
	if len(positional_notation[:]) == 0 {
		append(&positional_notation, 0)
	}
	slice.reverse(positional_notation[:])
	return positional_notation[:]
}
