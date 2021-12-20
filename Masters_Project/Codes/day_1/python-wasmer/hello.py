from wasmer import Instance


# Read the string pointed by the pointer.
def get_memory_string(memory):

    nth = 0
    string = ''
    while True:
        char = memory[nth]
        if char == 0:
            break

        string += chr(char)
        nth += 1
    return string


# Get the Wasm module as bytes.
wasm_bytes = open('../hello/hello.wasm', 'rb').read()

# Instantiates the Wasm module.
instance = Instance(wasm_bytes)

# Call a function that returns a pointer to a string for instance.
pointer = instance.exports.hello()

# Get the memory view, with the offset set to `pointer` (default is 0).
memory = instance.memory.uint8_view(pointer)

# Read the string pointed by the pointer.
string = get_memory_string(memory)

print(string)  # Hello World
