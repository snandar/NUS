(module
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "calc" (func $calc))
 (export "add" (func $func1))
 (export "sub" (func $func2))
 (func $calc (; 0 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eq
      (get_local $0)
      (i32.const 2)
     )
    )
    (set_local $3
     (i32.const -1)
    )
    (br_if $label$0
     (i32.ne
      (get_local $0)
      (i32.const 1)
     )
    )
    (return
     (i32.add
      (get_local $2)
      (get_local $1)
     )
    )
   )
   (set_local $3
    (i32.sub
     (get_local $1)
     (get_local $2)
    )
   )
  )
  (get_local $3)
 )
 (func $func1 (; 1 ;) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $1)
   (get_local $0)
  )
 )
 (func $func2 (; 2 ;) (param $0 i32) (param $1 i32) (result i32)
  (i32.sub
   (get_local $0)
   (get_local $1)
  )
 )
)
