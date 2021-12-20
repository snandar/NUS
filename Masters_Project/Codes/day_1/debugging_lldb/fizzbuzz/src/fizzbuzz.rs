use std::borrow::Cow;

fn main() {
	for i in 1..=20 {
		println!("{}", fizzbuzz(i));
	}
}

#[no_mangle]
pub fn fizzbuzz(i: u32) -> Cow<'static, str> {
    let by3 = i % 3 ==0;
    let by5 = i % 5 ==0;

    match (by3, by5) {
        (true, true) => "FizzBuzz".into(),
        (true, false) => "Fizz".into(),
        (false, true) => "Buzz".into(),
        (false, false) => i.to_string().into(),
    }
}
