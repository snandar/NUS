from wasmer import Instance

# Get the Wasm module as bytes.
wasm_bytes = open('../fibonacci/fib.wasm', 'rb').read()

# Instantiates the Wasm module.
instance = Instance(wasm_bytes)

# Call a function on it.
result = instance.exports.fib(8)

print(result)  # 21
