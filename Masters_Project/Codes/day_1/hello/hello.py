import pywasm
pywasm.on_debug()

vm = pywasm.load('hello.wasm')
r = vm.exec('hello', [])
print(vm.store.mems[0].data[r:r + 12])
