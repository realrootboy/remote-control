import threading

class interval_loop(threading.Thread):
    def __init__(self):
        self.event = None

    def set_interval(self,func, sec):
        def func_wrapper():
            self.set_interval(func, sec) 
            func()  
        self.event = threading.Timer(sec, func_wrapper)
        self.event.start()

    def cancel_interval(self):
        try:
            self.event.cancel()
        except Exception as e:
            print(e)