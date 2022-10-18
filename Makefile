broker:
	mosquitto -p 1884
	
sign-detector:
	python3 sign_detector.py

road-follower:
	python3 road_follower.py

subscriber:
	python3 subscriber.py

video-loop:
	ffmpeg -re -stream_loop 30 -i video1.mp4 -vf format=yuv420p -f v4l2 /dev/video0

create-devices:
	sudo modprobe v4l2loopback devices=7


clone-video:
	ffmpeg -f video4linux2 -i /dev/video5 -codec copy -f v4l2 /dev/video6 -codec copy -f v4l2 /dev/video7
