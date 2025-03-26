all: mpv_websocket
	uv tool install ffsubsync

mpv_websocket:
	rm -rf mpv_websocket_src
	git clone https://github.com/kuroahna/mpv_websocket.git mpv_websocket_src
	cd mpv_websocket_src && cargo update && cargo build --release
	mv mpv_websocket_src/target/release/mpv_websocket ./
	rm -rf mpv_websocket_src
