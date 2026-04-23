package all_your_base

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

	return to_positional_notation(number, output_base), .None
}

to_number :: proc(digits: []int, input_base: int) -> (int, Error) {
	number := 0
	for digit, i in digits {
		if digit < 0 || digit >= input_base {
			return number, .Invalid_Input_Digit
		}
		number = number * input_base + digit
	}

	return number, .None
}

to_positional_notation :: proc(number, output_base: int) -> []int {
	positional_notation := make([dynamic]int)
	n := number
	if n == 0 {
		append(&positional_notation, 0)
		return positional_notation[:]
	}
	for n > 0 {
		inject_at_elem(&positional_notation, 0, n % output_base)
		n /= output_base
	}
	return positional_notation[:]
}
