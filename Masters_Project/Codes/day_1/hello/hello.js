//buffer contains webassembly module
var buffer = new Uint8Array([0,97,115,109,1,0,0,0,1,133,128,128,128,0,1,96,0,1,127,3,130,128,128,128,0,1,0,4,132,128,128,128,0,1,112,0,0,5,131,128,128,128,0,1,0,1,6,129,128,128,128,0,0,7,146,128,128,128,0,2,6,109,101,109,111,114,121,2,0,5,104,101,108,108,111,0,0,10,138,128,128,128,0,1,132,128,128,128,0,0,65,16,11,11,146,128,128,128,0,1,0,65,16,11,12,72,101,108,108,111,32,87,111,114,108,100,0]);

//instantiate webassembly module with buffer
//API
var m = new WebAssembly.Instance(new WebAssembly.Module(buffer));

//memory of webassembly module
//pointer to linear memory
var h = new Uint8Array(m.exports.memory.buffer);

//pointer to the hello function in hello.c
//p calls webassembly module and gets back the value
var p = m.exports.hello();

//access inside the memory
//p returns a pointer to the array inside the memory. 
//This is why we need a loop to go through the linear memory
//h = memory, p = pointer inside memory
function utf8ToString(h, p) {
  let s = "";

  //for loop to concatenate 
  for (i = p; h[i]; i++) {
    s += String.fromCharCode(h[i]);
  }

  return s;
}
//console.log = print into console
console.log(utf8ToString(h, p));