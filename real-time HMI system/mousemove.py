# 控制鼠标移动（绝对位置）
import pyautogui
def mousemove(a,b):
  x = 1920*(a)/10
  y = 1080*(10-b)/10
  pyautogui.moveTo(x,y,0.1,pyautogui.easeOutQuad)

def key(a):
  pyautogui.press(a)