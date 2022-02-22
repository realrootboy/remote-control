import pyautogui

from interval import interval_loop

loop_controller = interval_loop()

def handle_message(websocket, message, mcDll):
    print("Received message: " + message)
    try:
        if message == "play":
            mcDll.play()
        elif message == "stop":
            mcDll.stop()
        elif message == "volume_up":
            mcDll.volume_up()
        elif message == "volume_down":
            mcDll.volume_down()
        elif message == "next_track":
            mcDll.next_track()
        elif message == "previous_track":
            mcDll.previous_track()
        elif message == "left_click":
            pyautogui.mouseDown()
            pyautogui.mouseUp()
        elif message == "right_click":
            pyautogui.mouseDown(button='right')
            pyautogui.mouseUp(button='right')
        elif message == "mouse_left":
            loop_controller.set_interval(lambda :pyautogui.move(-3,0), 0.01)
        elif message == "mouse_right":
            loop_controller.set_interval(lambda :pyautogui.move(3,0), 0.01)
        elif message == "mouse_up":
            loop_controller.set_interval(lambda :pyautogui.move(0,-3), 0.01)
        elif message == "mouse_down":
            loop_controller.set_interval(lambda :pyautogui.move(0,3), 0.01)
        elif message == "mouse_stop_move":
            loop_controller.cancel_interval()
        
    except Exception as e:
        print(e)
        print("error")