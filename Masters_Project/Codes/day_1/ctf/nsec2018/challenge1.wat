(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (import "env" "memory" (memory (;0;) 256 256))
  (import "env" "STACKTOP" (global (;0;) i32))
  (func (;0;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load8_s
    local.tee 2
    i32.eqz
    local.get 2
    local.get 1
    i32.load8_s
    local.tee 3
    i32.ne
    i32.or
    if  ;; label = @1
      local.get 3
      local.set 0
      local.get 2
      local.set 1
    else
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.load8_s
        local.tee 2
        i32.eqz
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_s
        local.tee 3
        i32.ne
        i32.or
        if  ;; label = @3
          local.get 3
          local.set 0
          local.get 2
          local.set 1
        else
          br 1 (;@2;)
        end
      end
    end
    local.get 1
    i32.const 255
    i32.and
    local.get 0
    i32.const 255
    i32.and
    i32.sub)
  (func (;1;) (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.const -1
    call 2
    local.get 0
    i32.const 1062
    call 0
    if (result i32)  ;; label = @1
      i32.const 0
    else
      local.get 1
      i32.const 1024
      call 0
      i32.eqz
    end)
  (func (;2;) (type 3) (param i32 i32)
    (local i32)
    local.get 0
    i32.load8_s
    local.tee 2
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 2
        local.get 1
        i32.xor
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.load8_s
        local.tee 2
        br_if 0 (;@2;)
      end
    end)
  (func (;3;) (type 1) (param i32)
    local.get 0
    global.set 1)
  (func (;4;) (type 0) (result i32)
    global.get 1)
  (func (;5;) (type 2) (param i32) (result i32)
    (local i32)
    global.get 1
    local.set 1
    global.get 1
    local.get 0
    i32.add
    global.set 1
    global.get 1
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 1
    local.get 1)
  (global (;1;) (mut i32) (global.get 0))
  (export "_authenticate" (func 1))
  (export "stackAlloc" (func 5))
  (export "stackRestore" (func 3))
  (export "stackSave" (func 4))
  (data (;0;) (i32.const 1024) "\b9\b3\be\b8\d2\cf\c8\bd\cf\cf\b9\bd\c8\c7\ba\c9\bb\bd\ca\cb\cf\c8\cd\ba\ba\b9\cc\cb\bd\c6\cf\ca\ce\b9\be\cb\ca\00admin"))
