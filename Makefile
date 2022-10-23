.PHONY: all build flash

all: build flash

build:
	cargo build --release

flash:
	avrdude -p m328p -c arduino -P /dev/tty.usbmodem211201 -b 115200 -U flash:w:./target/avr-atmega328p/release/rust-arduino-blink.elf

clean:
	cargo clean
