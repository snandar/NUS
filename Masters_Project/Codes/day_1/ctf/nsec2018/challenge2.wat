(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i32 i64) (result i32)))
  (type (;7;) (func (param i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i64) (result i64)))
  (import "env" "memory" (memory (;0;) 256 256))
  (import "env" "table" (table (;0;) 1 1 funcref))
  (import "env" "tableBase" (global (;0;) i32))
  (import "env" "STACKTOP" (global (;1;) i32))
  (import "env" "abort" (func (;0;) (type 1)))
  (import "env" "_emscripten_memcpy_big" (func (;1;) (type 0)))
  (func (;2;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 104
        i32.add
        local.tee 1
        i32.load
        local.tee 2
        if  ;; label = @3
          local.get 0
          i32.load offset=108
          local.get 2
          i32.ge_s
          br_if 1 (;@2;)
        end
        local.get 0
        call 11
        local.tee 4
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        i32.const 8
        i32.add
        local.set 2
        local.get 0
        local.get 1
        i32.load
        local.tee 1
        if (result i32)  ;; label = @3
          local.get 2
          i32.load
          local.tee 3
          local.set 2
          local.get 3
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.sub
          local.get 1
          local.get 0
          i32.load offset=108
          i32.sub
          local.tee 1
          i32.lt_s
          if (result i32)  ;; label = @4
            local.get 2
          else
            local.get 3
            local.get 1
            i32.const -1
            i32.add
            i32.add
          end
        else
          local.get 2
          i32.load
          local.tee 2
        end
        local.tee 1
        i32.store offset=100
        local.get 0
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        if  ;; label = @3
          local.get 0
          i32.const 108
          i32.add
          local.tee 3
          local.get 2
          i32.const 1
          i32.add
          local.get 1
          i32.load
          local.tee 0
          i32.sub
          local.get 3
          i32.load
          i32.add
          i32.store
        else
          local.get 1
          i32.load
          local.set 0
        end
        local.get 4
        local.get 0
        i32.const -1
        i32.add
        local.tee 0
        i32.load8_u
        i32.ne
        if  ;; label = @3
          local.get 0
          local.get 4
          i32.store8
        end
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=100
      i32.const -1
      local.set 4
    end
    local.get 4)
  (func (;3;) (type 4) (param i32 i32)
    (local i32 i32 i32)
    local.get 0
    local.get 1
    i32.store offset=104
    local.get 0
    local.get 0
    i32.load offset=8
    local.tee 2
    local.get 0
    i32.load offset=4
    local.tee 3
    i32.sub
    local.tee 4
    i32.store offset=108
    local.get 0
    local.get 3
    local.get 1
    i32.add
    local.get 2
    local.get 1
    i32.const 0
    i32.ne
    local.get 4
    local.get 1
    i32.gt_s
    i32.and
    select
    i32.store offset=100)
  (func (;4;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    loop  ;; label = @1
      local.get 0
      local.get 6
      local.get 0
      local.get 4
      i32.add
      local.tee 5
      i32.load8_s
      local.tee 3
      i32.const 255
      i32.and
      i32.add
      local.get 1
      local.get 4
      local.get 2
      i32.rem_u
      i32.add
      i32.load8_u
      i32.add
      i32.const 256
      i32.rem_s
      local.tee 6
      i32.add
      local.tee 7
      i32.load8_s
      local.get 3
      i32.xor
      local.tee 3
      i32.const 255
      i32.and
      if  ;; label = @2
        local.get 5
        local.get 3
        i32.store8
        local.get 7
        local.get 7
        i32.load8_s
        local.get 3
        i32.xor
        local.tee 3
        i32.store8
        local.get 5
        local.get 5
        i32.load8_s
        local.get 3
        i32.xor
        i32.store8
      end
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.const 256
      i32.ne
      br_if 0 (;@1;)
    end)
  (func (;5;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 2
    if  ;; label = @1
      local.get 0
      i32.const 256
      i32.add
      local.set 4
      local.get 0
      i32.const 257
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 4
        local.get 4
        i32.load8_s
        i32.const 1
        i32.add
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.tee 3
        i32.store8
        local.get 5
        local.get 5
        i32.load8_u
        local.get 0
        local.get 3
        i32.const 255
        i32.and
        i32.add
        local.tee 7
        i32.load8_u
        i32.add
        local.tee 3
        i32.const 255
        i32.and
        local.tee 8
        i32.store8
        local.get 0
        local.get 3
        i32.const 255
        i32.and
        i32.add
        i32.load8_s
        local.get 7
        i32.load8_s
        local.tee 3
        i32.xor
        local.tee 9
        i32.const 255
        i32.and
        if  ;; label = @3
          local.get 7
          local.get 9
          i32.store8
          local.get 0
          local.get 5
          i32.load8_u
          i32.add
          local.tee 3
          local.get 3
          i32.load8_s
          local.get 0
          local.get 4
          i32.load8_u
          i32.add
          i32.load8_s
          i32.xor
          i32.store8
          local.get 0
          local.get 4
          i32.load8_u
          i32.add
          local.tee 3
          local.get 3
          i32.load8_s
          local.get 0
          local.get 5
          i32.load8_u
          i32.add
          i32.load8_s
          i32.xor
          i32.store8
          local.get 0
          local.get 4
          i32.load8_u
          i32.add
          i32.load8_s
          local.set 3
          local.get 5
          i32.load8_s
          local.set 8
        end
        local.get 1
        local.get 6
        i32.add
        local.get 0
        local.get 0
        local.get 8
        i32.const 255
        i32.and
        i32.add
        i32.load8_u
        local.get 3
        i32.const 255
        i32.and
        i32.add
        i32.const 255
        i32.and
        i32.add
        i32.load8_s
        i32.store8
        local.get 6
        i32.const 1
        i32.add
        local.tee 6
        local.get 2
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func (;6;) (type 1) (param i32)
    (local i32)
    local.get 0
    i32.const 0
    i32.store8 offset=257
    local.get 0
    i32.const 0
    i32.store8 offset=256
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.get 1
      i32.store8
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 256
      i32.ne
      br_if 0 (;@1;)
    end)
  (func (;7;) (type 0) (param i32 i32 i32) (result i32)
    i32.const 0
    call 0
    i32.const 0)
  (func (;8;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 8192
    i32.ge_s
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      call 1
      return
    end
    local.get 0
    local.set 4
    local.get 0
    local.get 2
    i32.add
    local.set 3
    local.get 0
    i32.const 3
    i32.and
    local.get 1
    i32.const 3
    i32.and
    i32.eq
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        if  ;; label = @3
          local.get 2
          i32.eqz
          if  ;; label = @4
            local.get 4
            return
          end
          local.get 0
          local.get 1
          i32.load8_s
          i32.store8
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.sub
          local.set 2
          br 1 (;@2;)
        end
      end
      local.get 3
      i32.const -4
      i32.and
      local.tee 2
      i32.const -64
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 0
        local.get 5
        i32.le_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 0
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 0
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 0
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 0
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 0
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 0
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 0
          local.get 1
          i32.load offset=32
          i32.store offset=32
          local.get 0
          local.get 1
          i32.load offset=36
          i32.store offset=36
          local.get 0
          local.get 1
          i32.load offset=40
          i32.store offset=40
          local.get 0
          local.get 1
          i32.load offset=44
          i32.store offset=44
          local.get 0
          local.get 1
          i32.load offset=48
          i32.store offset=48
          local.get 0
          local.get 1
          i32.load offset=52
          i32.store offset=52
          local.get 0
          local.get 1
          i32.load offset=56
          i32.store offset=56
          local.get 0
          local.get 1
          i32.load offset=60
          i32.store offset=60
          local.get 0
          i32.const -64
          i32.sub
          local.set 0
          local.get 1
          i32.const -64
          i32.sub
          local.set 1
          br 1 (;@2;)
        end
      end
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
    else
      local.get 3
      i32.const 4
      i32.sub
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load8_s
          i32.store8
          local.get 0
          local.get 1
          i32.load8_s offset=1
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.load8_s offset=2
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.load8_s offset=3
          i32.store8 offset=3
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
    end
    loop  ;; label = @1
      local.get 0
      local.get 3
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_s
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        br 1 (;@1;)
      end
    end
    local.get 4)
  (func (;9;) (type 8) (param i32 i32 i32 i64) (result i64)
    (local i32 i32 i32 i32)
    global.get 2
    local.set 5
    global.get 2
    i32.const 128
    i32.add
    global.set 2
    local.get 5
    local.tee 4
    i32.const 0
    i32.store
    local.get 4
    i32.const 4
    i32.add
    local.tee 6
    local.get 0
    i32.store
    local.get 4
    local.get 0
    i32.store offset=44
    local.get 4
    i32.const 8
    i32.add
    local.tee 7
    i32.const -1
    local.get 0
    i32.const 2147483647
    i32.add
    local.get 0
    i32.const 0
    i32.lt_s
    select
    i32.store
    local.get 4
    i32.const -1
    i32.store offset=76
    local.get 4
    i32.const 0
    call 3
    local.get 4
    local.get 2
    i32.const 1
    local.get 3
    call 12
    local.set 3
    local.get 1
    if  ;; label = @1
      local.get 1
      local.get 0
      local.get 6
      i32.load
      local.get 4
      i32.load offset=108
      i32.add
      local.get 7
      i32.load
      i32.sub
      i32.add
      i32.store
    end
    local.get 5
    global.set 2
    local.get 3)
  (func (;10;) (type 3) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 74
    i32.add
    local.tee 2
    i32.load8_s
    local.set 1
    local.get 2
    local.get 1
    i32.const 255
    i32.add
    local.get 1
    i32.or
    i32.store8
    local.get 0
    i32.const 20
    i32.add
    local.tee 1
    i32.load
    local.get 0
    i32.const 28
    i32.add
    local.tee 2
    i32.load
    i32.gt_u
    if  ;; label = @1
      local.get 0
      i32.load offset=36
      drop
      local.get 0
      i32.const 0
      i32.const 0
      i32.const 0
      call_indirect (type 0)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 2
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store
    local.get 0
    i32.load
    local.tee 1
    i32.const 4
    i32.and
    if (result i32)  ;; label = @1
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
    else
      local.get 0
      local.get 0
      i32.load offset=44
      local.get 0
      i32.load offset=48
      i32.add
      local.tee 2
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 1
      i32.const 27
      i32.shl
      i32.const 31
      i32.shr_s
    end
    local.tee 0)
  (func (;11;) (type 3) (param i32) (result i32)
    (local i32 i32)
    global.get 2
    local.set 1
    global.get 2
    i32.const 16
    i32.add
    global.set 2
    local.get 1
    local.set 2
    local.get 0
    call 10
    if (result i32)  ;; label = @1
      i32.const -1
    else
      local.get 0
      i32.load offset=32
      drop
      local.get 0
      local.get 2
      i32.const 1
      i32.const 0
      call_indirect (type 0)
      i32.const 1
      i32.eq
      if (result i32)  ;; label = @2
        local.get 2
        i32.load8_u
      else
        i32.const -1
      end
    end
    local.set 0
    local.get 1
    global.set 2
    local.get 0)
  (func (;12;) (type 8) (param i32 i32 i32 i64) (result i64)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64)
    block  ;; label = @1
      local.get 1
      i32.const 36
      i32.gt_u
      if (result i64)  ;; label = @2
        i32.const 1800
        i32.const 22
        i32.store
        i64.const 0
      else
        local.get 0
        i32.const 4
        i32.add
        local.set 5
        local.get 0
        i32.const 100
        i32.add
        local.set 6
        loop  ;; label = @3
          local.get 5
          i32.load
          local.tee 8
          local.get 6
          i32.load
          i32.lt_u
          if (result i32)  ;; label = @4
            local.get 5
            local.get 8
            i32.const 1
            i32.add
            i32.store
            local.get 8
            i32.load8_u
          else
            local.get 0
            call 2
          end
          local.tee 4
          local.tee 7
          i32.const 32
          i32.eq
          local.get 7
          i32.const -9
          i32.add
          i32.const 5
          i32.lt_u
          i32.or
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              i32.const 43
              i32.sub
              br_table 0 (;@5;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            local.get 4
            i32.const 45
            i32.eq
            i32.const 31
            i32.shl
            i32.const 31
            i32.shr_s
            local.set 8
            local.get 5
            i32.load
            local.tee 4
            local.get 6
            i32.load
            i32.lt_u
            if (result i32)  ;; label = @5
              local.get 5
              local.get 4
              i32.const 1
              i32.add
              i32.store
              local.get 4
              i32.load8_u
            else
              local.get 0
              call 2
            end
            local.set 4
            br 1 (;@3;)
          end
          i32.const 0
          local.set 8
        end
        local.get 1
        i32.eqz
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const 16
                i32.or
                i32.const 16
                i32.eq
                local.get 4
                i32.const 48
                i32.eq
                i32.and
                if  ;; label = @7
                  local.get 5
                  i32.load
                  local.tee 4
                  local.get 6
                  i32.load
                  i32.lt_u
                  if (result i32)  ;; label = @8
                    local.get 5
                    local.get 4
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 4
                    i32.load8_u
                  else
                    local.get 0
                    call 2
                  end
                  local.tee 4
                  i32.const 32
                  i32.or
                  i32.const 120
                  i32.ne
                  if  ;; label = @8
                    local.get 7
                    if  ;; label = @9
                      local.get 4
                      local.set 2
                      i32.const 8
                      local.set 1
                      br 4 (;@5;)
                    else
                      local.get 4
                      local.set 2
                      br 3 (;@6;)
                    end
                    unreachable
                  end
                  local.get 5
                  i32.load
                  local.tee 1
                  local.get 6
                  i32.load
                  i32.lt_u
                  if (result i32)  ;; label = @8
                    local.get 5
                    local.get 1
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 1
                    i32.load8_u
                  else
                    local.get 0
                    call 2
                  end
                  local.tee 1
                  i32.const 1037
                  i32.add
                  i32.load8_u
                  i32.const 15
                  i32.gt_s
                  if  ;; label = @8
                    local.get 6
                    i32.load
                    i32.eqz
                    local.tee 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 5
                      local.get 5
                      i32.load
                      i32.const -1
                      i32.add
                      i32.store
                    end
                    local.get 2
                    i32.eqz
                    if  ;; label = @9
                      local.get 0
                      i32.const 0
                      call 3
                      i64.const 0
                      local.set 3
                      br 8 (;@1;)
                    end
                    local.get 1
                    if  ;; label = @9
                      i64.const 0
                      local.set 3
                      br 8 (;@1;)
                    end
                    local.get 5
                    local.get 5
                    i32.load
                    i32.const -1
                    i32.add
                    i32.store
                    i64.const 0
                    local.set 3
                    br 7 (;@1;)
                  else
                    local.get 1
                    local.set 2
                    i32.const 16
                    local.set 1
                    br 3 (;@5;)
                  end
                  unreachable
                else
                  i32.const 10
                  local.get 1
                  local.get 7
                  select
                  local.tee 1
                  local.get 4
                  i32.const 1037
                  i32.add
                  i32.load8_u
                  i32.gt_u
                  if  ;; label = @8
                    local.get 4
                    local.set 2
                  else
                    local.get 6
                    i32.load
                    if  ;; label = @9
                      local.get 5
                      local.get 5
                      i32.load
                      i32.const -1
                      i32.add
                      i32.store
                    end
                    local.get 0
                    i32.const 0
                    call 3
                    i32.const 1800
                    i32.const 22
                    i32.store
                    i64.const 0
                    local.set 3
                    br 7 (;@1;)
                  end
                end
              end
              local.get 1
              i32.const 10
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              i32.const -48
              i32.add
              local.tee 1
              i32.const 10
              i32.lt_u
              if (result i32)  ;; label = @6
                i32.const 0
                local.set 2
                loop  ;; label = @7
                  local.get 2
                  i32.const 10
                  i32.mul
                  local.get 1
                  i32.add
                  local.set 2
                  local.get 5
                  i32.load
                  local.tee 1
                  local.get 6
                  i32.load
                  i32.lt_u
                  if (result i32)  ;; label = @8
                    local.get 5
                    local.get 1
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 1
                    i32.load8_u
                  else
                    local.get 0
                    call 2
                  end
                  local.tee 4
                  i32.const -48
                  i32.add
                  local.tee 1
                  i32.const 10
                  i32.lt_u
                  local.get 2
                  i32.const 429496729
                  i32.lt_u
                  i32.and
                  br_if 0 (;@7;)
                end
                local.get 2
                i64.extend_i32_u
                local.set 11
                local.get 4
              else
                local.get 2
              end
              local.tee 1
              i32.const -48
              i32.add
              local.tee 2
              i32.const 10
              i32.lt_u
              if  ;; label = @6
                loop  ;; label = @7
                  local.get 11
                  i64.const 10
                  i64.mul
                  local.tee 12
                  local.get 2
                  i64.extend_i32_s
                  local.tee 13
                  i64.const -1
                  i64.xor
                  i64.gt_u
                  if  ;; label = @8
                    i32.const 10
                    local.set 2
                    br 4 (;@4;)
                  end
                  local.get 12
                  local.get 13
                  i64.add
                  local.set 11
                  local.get 5
                  i32.load
                  local.tee 1
                  local.get 6
                  i32.load
                  i32.lt_u
                  if (result i32)  ;; label = @8
                    local.get 5
                    local.get 1
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 1
                    i32.load8_u
                  else
                    local.get 0
                    call 2
                  end
                  local.tee 1
                  i32.const -48
                  i32.add
                  local.tee 2
                  i32.const 10
                  i32.lt_u
                  local.get 11
                  i64.const 1844674407370955162
                  i64.lt_u
                  i32.and
                  br_if 0 (;@7;)
                end
                local.get 2
                i32.const 9
                i32.le_u
                if  ;; label = @7
                  i32.const 10
                  local.set 2
                  br 3 (;@4;)
                end
              end
              br 2 (;@3;)
            end
            local.get 1
            i32.const -1
            i32.add
            local.get 1
            i32.and
            i32.eqz
            if  ;; label = @5
              local.get 1
              i32.const 23
              i32.mul
              i32.const 5
              i32.shr_u
              i32.const 7
              i32.and
              i32.const 1293
              i32.add
              i32.load8_s
              local.set 10
              local.get 1
              local.get 1
              local.get 2
              i32.const 1037
              i32.add
              i32.load8_s
              local.tee 9
              i32.const 255
              i32.and
              local.tee 7
              i32.gt_u
              if (result i32)  ;; label = @6
                i32.const 0
                local.set 4
                local.get 7
                local.set 2
                loop  ;; label = @7
                  local.get 2
                  local.get 4
                  local.get 10
                  i32.shl
                  i32.or
                  local.tee 4
                  i32.const 134217728
                  i32.lt_u
                  local.get 1
                  local.get 5
                  i32.load
                  local.tee 2
                  local.get 6
                  i32.load
                  i32.lt_u
                  if (result i32)  ;; label = @8
                    local.get 5
                    local.get 2
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 2
                    i32.load8_u
                  else
                    local.get 0
                    call 2
                  end
                  local.tee 9
                  i32.const 1037
                  i32.add
                  i32.load8_s
                  local.tee 7
                  i32.const 255
                  i32.and
                  local.tee 2
                  i32.gt_u
                  i32.and
                  br_if 0 (;@7;)
                end
                local.get 4
                i64.extend_i32_u
                local.set 11
                local.get 9
                local.set 4
                local.get 7
              else
                local.get 2
                local.set 4
                local.get 9
              end
              local.tee 2
              i32.const 255
              i32.and
              i32.le_u
              i64.const -1
              local.get 10
              i64.extend_i32_u
              local.tee 12
              i64.shr_u
              local.tee 13
              local.get 11
              i64.lt_u
              i32.or
              if  ;; label = @6
                local.get 1
                local.set 2
                local.get 4
                local.set 1
                br 2 (;@4;)
              end
              loop  ;; label = @6
                local.get 1
                local.get 5
                i32.load
                local.tee 4
                local.get 6
                i32.load
                i32.lt_u
                if (result i32)  ;; label = @7
                  local.get 5
                  local.get 4
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 4
                  i32.load8_u
                else
                  local.get 0
                  call 2
                end
                local.tee 7
                i32.const 1037
                i32.add
                i32.load8_s
                local.tee 4
                i32.const 255
                i32.and
                i32.le_u
                local.get 11
                local.get 12
                i64.shl
                local.get 2
                i32.const 255
                i32.and
                i64.extend_i32_u
                i64.or
                local.tee 11
                local.get 13
                i64.gt_u
                i32.or
                if  ;; label = @7
                  local.get 1
                  local.set 2
                  local.get 7
                  local.set 1
                  br 3 (;@4;)
                else
                  local.get 4
                  local.set 2
                  br 1 (;@6;)
                end
                unreachable
              end
              unreachable
            end
            local.get 1
            i64.extend_i32_u
            local.set 14
            local.get 1
            local.get 1
            local.get 2
            i32.const 1037
            i32.add
            i32.load8_s
            local.tee 9
            i32.const 255
            i32.and
            local.tee 7
            i32.gt_u
            if (result i32)  ;; label = @5
              i32.const 0
              local.set 4
              local.get 7
              local.set 2
              loop  ;; label = @6
                local.get 2
                local.get 4
                local.get 1
                i32.mul
                i32.add
                local.tee 4
                i32.const 119304647
                i32.lt_u
                local.get 1
                local.get 5
                i32.load
                local.tee 2
                local.get 6
                i32.load
                i32.lt_u
                if (result i32)  ;; label = @7
                  local.get 5
                  local.get 2
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 2
                  i32.load8_u
                else
                  local.get 0
                  call 2
                end
                local.tee 9
                i32.const 1037
                i32.add
                i32.load8_s
                local.tee 7
                i32.const 255
                i32.and
                local.tee 2
                i32.gt_u
                i32.and
                br_if 0 (;@6;)
              end
              local.get 4
              i64.extend_i32_u
              local.set 11
              local.get 9
              local.set 4
              local.get 7
            else
              local.get 2
              local.set 4
              local.get 9
            end
            local.tee 2
            i32.const 255
            i32.and
            i32.gt_u
            if  ;; label = @5
              i64.const -1
              local.get 14
              i64.div_u
              local.set 15
              loop  ;; label = @6
                local.get 11
                local.get 15
                i64.gt_u
                if  ;; label = @7
                  local.get 1
                  local.set 2
                  local.get 4
                  local.set 1
                  br 3 (;@4;)
                end
                local.get 11
                local.get 14
                i64.mul
                local.tee 12
                local.get 2
                i32.const 255
                i32.and
                i64.extend_i32_u
                local.tee 13
                i64.const -1
                i64.xor
                i64.gt_u
                if  ;; label = @7
                  local.get 1
                  local.set 2
                  local.get 4
                  local.set 1
                  br 3 (;@4;)
                end
                local.get 12
                local.get 13
                i64.add
                local.set 11
                local.get 1
                local.get 5
                i32.load
                local.tee 2
                local.get 6
                i32.load
                i32.lt_u
                if (result i32)  ;; label = @7
                  local.get 5
                  local.get 2
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 2
                  i32.load8_u
                else
                  local.get 0
                  call 2
                end
                local.tee 4
                i32.const 1037
                i32.add
                i32.load8_s
                local.tee 2
                i32.const 255
                i32.and
                i32.gt_u
                br_if 0 (;@6;)
                local.get 1
                local.set 2
                local.get 4
                local.set 1
              end
            else
              local.get 1
              local.set 2
              local.get 4
              local.set 1
            end
          end
          local.get 2
          local.get 1
          i32.const 1037
          i32.add
          i32.load8_u
          i32.gt_u
          if  ;; label = @4
            loop  ;; label = @5
              local.get 2
              local.get 5
              i32.load
              local.tee 1
              local.get 6
              i32.load
              i32.lt_u
              if (result i32)  ;; label = @6
                local.get 5
                local.get 1
                i32.const 1
                i32.add
                i32.store
                local.get 1
                i32.load8_u
              else
                local.get 0
                call 2
              end
              i32.const 1037
              i32.add
              i32.load8_u
              i32.gt_u
              br_if 0 (;@5;)
            end
            i32.const 1800
            i32.const 34
            i32.store
            local.get 8
            i32.const 0
            local.get 3
            i64.const 1
            i64.and
            i64.const 0
            i64.eq
            select
            local.set 8
            local.get 3
            local.set 11
          end
        end
        local.get 6
        i32.load
        if  ;; label = @3
          local.get 5
          local.get 5
          i32.load
          i32.const -1
          i32.add
          i32.store
        end
        local.get 11
        local.get 3
        i64.ge_u
        if  ;; label = @3
          local.get 3
          i64.const 1
          i64.and
          i64.const 0
          i64.ne
          local.get 8
          i32.const 0
          i32.ne
          i32.or
          i32.eqz
          if  ;; label = @4
            i32.const 1800
            i32.const 34
            i32.store
            local.get 3
            i64.const -1
            i64.add
            local.set 3
            br 3 (;@1;)
          end
          local.get 11
          local.get 3
          i64.gt_u
          if  ;; label = @4
            i32.const 1800
            i32.const 34
            i32.store
            br 3 (;@1;)
          end
        end
        local.get 11
        local.get 8
        i64.extend_i32_s
        local.tee 3
        i64.xor
        local.get 3
        i64.sub
      end
      local.set 3
    end
    local.get 3)
  (func (;13;) (type 1) (param i32)
    local.get 0
    global.set 2)
  (func (;14;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      local.tee 2
      i32.const 3
      i32.and
      if  ;; label = @2
        local.get 0
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.load8_s
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const 1
          i32.add
          local.tee 1
          local.tee 0
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 1
          local.set 0
        end
      end
      loop  ;; label = @2
        local.get 0
        i32.const 4
        i32.add
        local.set 1
        local.get 0
        i32.load
        local.tee 3
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 1
          local.set 0
          br 1 (;@2;)
        end
      end
      local.get 3
      i32.const 255
      i32.and
      if  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.load8_s
          br_if 0 (;@3;)
        end
      end
    end
    local.get 0
    local.get 2
    i32.sub)
  (func (;15;) (type 7) (param i32 i32) (result i32)
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
  (func (;16;) (type 7) (param i32 i32) (result i32)
    (local i64)
    local.get 1
    i32.const 0
    i32.const 2
    i64.const -1
    call 9
    local.set 2
    local.get 0
    i32.const 1024
    call 15
    if (result i32)  ;; label = @1
      i32.const 0
    else
      local.get 0
      i32.const 1030
      i32.const 6
      local.get 2
      call 17
      i32.const 0
      i32.ne
    end)
  (func (;17;) (type 6) (param i32 i32 i32 i64) (result i32)
    (local i32 i32 i32)
    global.get 2
    local.set 4
    global.get 2
    i32.const 528
    i32.add
    global.set 2
    local.get 4
    local.tee 6
    local.get 3
    i64.store
    local.get 4
    i32.const 264
    i32.add
    local.tee 5
    call 6
    local.get 5
    local.get 1
    local.get 2
    call 4
    local.get 4
    i32.const 8
    i32.add
    local.tee 1
    local.get 0
    local.get 0
    call 14
    local.tee 0
    call 8
    drop
    local.get 5
    local.get 1
    local.get 0
    i32.add
    i32.const 256
    local.get 0
    i32.sub
    call 5
    local.get 5
    local.get 1
    i32.const 256
    call 4
    local.get 5
    local.get 6
    i32.const 8
    call 18
    local.set 0
    local.get 4
    global.set 2
    local.get 0)
  (func (;18;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 2
      if  ;; label = @2
        local.get 0
        i32.const 257
        i32.add
        local.tee 4
        i32.load8_s
        local.set 5
        local.get 0
        i32.const 256
        i32.add
        local.tee 6
        i32.load8_s
        local.set 3
        loop  ;; label = @3
          local.get 6
          local.get 3
          i32.const 1
          i32.add
          i32.const 24
          i32.shl
          i32.const 24
          i32.shr_s
          local.tee 3
          i32.store8
          local.get 4
          local.get 5
          i32.const 255
          i32.and
          local.get 0
          local.get 3
          i32.const 255
          i32.and
          i32.add
          local.tee 9
          i32.load8_u
          i32.add
          local.tee 7
          i32.const 255
          i32.and
          local.tee 5
          i32.store8
          local.get 0
          local.get 7
          i32.const 255
          i32.and
          i32.add
          i32.load8_s
          local.get 9
          i32.load8_s
          local.tee 7
          i32.xor
          local.tee 10
          i32.const 255
          i32.and
          if  ;; label = @4
            local.get 9
            local.get 10
            i32.store8
            local.get 0
            local.get 4
            i32.load8_u
            i32.add
            local.tee 3
            local.get 3
            i32.load8_s
            local.get 0
            local.get 6
            i32.load8_u
            i32.add
            i32.load8_s
            i32.xor
            i32.store8
            local.get 0
            local.get 6
            i32.load8_u
            i32.add
            local.tee 3
            local.get 3
            i32.load8_s
            local.get 0
            local.get 4
            i32.load8_u
            i32.add
            i32.load8_s
            i32.xor
            i32.store8
            local.get 0
            local.get 6
            i32.load8_s
            local.tee 3
            i32.const 255
            i32.and
            i32.add
            i32.load8_s
            local.set 7
            local.get 4
            i32.load8_s
            local.set 5
          end
          local.get 1
          local.get 8
          i32.add
          i32.load8_s
          local.get 0
          local.get 0
          local.get 5
          i32.const 255
          i32.and
          i32.add
          i32.load8_u
          local.get 7
          i32.const 255
          i32.and
          i32.add
          i32.const 255
          i32.and
          i32.add
          i32.load8_s
          i32.ne
          if  ;; label = @4
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          local.get 8
          i32.const 1
          i32.add
          local.tee 8
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 1
          local.set 0
        end
      else
        i32.const 1
        local.set 0
      end
    end
    local.get 0)
  (func (;19;) (type 2) (result i32)
    global.get 2)
  (func (;20;) (type 3) (param i32) (result i32)
    (local i32)
    global.get 2
    local.set 1
    global.get 2
    local.get 0
    i32.add
    global.set 2
    global.get 2
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 2
    local.get 1)
  (global (;2;) (mut i32) (global.get 1))
  (export "_authenticate" (func 16))
  (export "stackAlloc" (func 20))
  (export "stackRestore" (func 13))
  (export "stackSave" (func 19))
  (elem (;0;) (global.get 0) 7)
  (data (;0;) (i32.const 1024) "admin\00salty\00\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\01\02\03\04\05\06\07\08\09\ff\ff\ff\ff\ff\ff\ff\0a\0b\0c\0d\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\22#\ff\ff\ff\ff\ff\ff\0a\0b\0c\0d\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\22#\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\01\02\04\07\03\06\05"))
