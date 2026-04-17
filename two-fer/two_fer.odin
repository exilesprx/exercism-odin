package two_fer

import "core:fmt"

two_fer :: proc(name: string = "") -> string {
	return fmt.tprintf("One for %s, one for me.", "you" if name == "" else name)
}
