(module
	(memory $mem 1)
	(func $goit
		i32.const 32

		i32.const 0
		v128.load
		i32.const 16
		v128.load
		i32x4.add

		v128.store)
	(export "goit" (func $goit))
	(export "memory" (memory $mem))
)