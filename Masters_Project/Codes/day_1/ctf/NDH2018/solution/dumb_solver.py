import pywasm
vm = pywasm.load('dumb_solver.wasm')

l = [(1616, 4), (1638, 4), (1610, 5), (1598, 4), (1681, 3), (1654, 9)]

for offset, size in l:
    print(vm.store.mems[0].data[offset:offset+size])
