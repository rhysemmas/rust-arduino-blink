# rust-arduino-blink

### Versions

Compiler
`rustc 1.64.0-nightly (6dba4ed21 2022-07-09)`

Dependency manager
`cargo 1.64.0-nightly (c0bbd42ce 2022-07-03)`

Set with:
`$ rustup override set nightly-2022-07-10`

Or using a [rust-toolchain](./rust-toolchain.toml) file.

### Build options

`$ cargo build --release`

Got error:

```
$ ~/github-repos/rust-arduino-blink  % cargo build --release
   Compiling rust-arduino-blink v0.1.0 (/Users/rhys/github-repos/rust-arduino-blink)
error: language item required, but not found: `eh_personality`
  |
  = note: this can occur when a binary crate with `#![no_std]` is compiled for a target where `eh_personality` is defined in the standard library
  = help: you may be able to compile for a target that doesn't need `eh_personality`, specify a target with `--target` or in `.cargo/config`
```

Fixed by adding the following to Cargo.toml:

```
[profile.release]
panic = "abort"
```

### Flashing

`note`: replace device path with whatever the arduino is plugged into

`avrdude -p m328p -c arduino -P /dev/tty.usbmodem211201 -b 115200 -U flash:w:./target/avr-atmega328p/release/rust-arduino-blink.elf`

### Dependencies

Using hardware abstraction layer for arduino-uno from `arduino-hal` by Rahix.

https://github.com/Rahix/avr-hal

### Useful links

AVR Rust book: https://book.avr-rust.com/001-introduction.html  
Language item error explanation: https://os.phil-opp.com/freestanding-rust-binary/#the-1  
Using rust-toolchain file: https://rust-lang.github.io/rustup/overrides.html#the-toolchain-file  
