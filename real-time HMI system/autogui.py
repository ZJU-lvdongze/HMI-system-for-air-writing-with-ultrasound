def get_mouse_positon():# 获取鼠标位置
  time.sleep(0.2) # 准备时间
  #print('开始获取鼠标位置')
  try:
    # Get and print the mouse coordinates.
    x, y = pyautogui.position()
    positionStr = '鼠标坐标点(X,Y)为：{},{}'.format(str(x).rjust(4), str(y).rjust(4))
    print(positionStr)
    time.sleep(0.1) # 停顿时间
  except:
    print('获取鼠标位置失败')
# while True:
#     get_mouse_positon()
from datetime import datetime
from tkinter.font import names
print()
print("时间：" + str(datetime.now()))
print()

import pyautogui
import time
pyautogui.PAUSE = 0.5   #执行autogui语法后停顿0.5s
pyautogui.FAILSAFE = True
w,d = pyautogui.size()      #检查屏幕宽度
print(w,d)
x,y=pyautogui.position()    #检查鼠标位置    
print(x,y)

# # 鼠标语法例子
# pyautogui.moveTo(100, 100, duration=0.25)               # 移动到 (100,100)
# pyautogui.moveRel(100, 0, duration=0.25)                # 从当前位置右移100像素
# pyautogui.dragTo(300, 400, 2, button='left')            # 按住鼠标左键，用2秒钟把鼠标拖拽到(300, 400)位置
# pyautogui.mouseDown(button='right')                     # 按下鼠标右键
# pyautogui.mouseUp(button='right', x=100, y=200)         # 移动到(100, 200)位置，然后松开鼠标右键
# pyautogui.click(10, 20, 2, 0.25, button='left')         # 鼠标移动到（10,20）点击2次，间隔0.25s
# pyautogui.scroll(10, x=100, y=100)                      # 移动到(100, 100)位置再向上滚动10格
# pyautogui.moveTo(100, 100, 2, pyautogui.easeOutQuad)    # 开始和结束都快，中间比较慢
# # 键盘语法例子
# pyautogui.typewrite('Hello world!', interval=0.25)      # 每次输入间隔0.25秒，输入Hello world!
# pyautogui.press(['left', 'left', 'left', 'left'])       # 按下并松开（轻敲）四下左方向键
# pyautogui.keyDown('shift')                              # 输出 $ 符号的按键
# pyautogui.press('4')
# pyautogui.keyUp('shift') 
# pyautogui.hotkey('ctrl', 'v')                           # 组合按键（Ctrl+V），按下并松开'ctrl'和'v'按键
# # 弹框语法例子
# b = pyautogui.alert(text='要开始程序么？', title='请求框', button='OK')
# print(b) # 输出结果为OK
# pyautogui.confirm(text='', title='', buttons=['OK', 'Cancel']) # OK和Cancel按钮的消息弹窗
# a = pyautogui.confirm(text='', title='', buttons=range(10))# 10个按键0-9的消息弹窗
# print(a) # 输出结果为你选的数字
# pyautogui.password(text='', title='', default='', mask='*')
 
# 控制鼠标移动（绝对位置）
def mousemove(a,b):
  x = 1920*(a)/10
  y = 1080*(10-b)/10
  pyautogui.moveTo(x,y,0.25,pyautogui.easeInOutQuad)

mousemove(5,5)
mousemove(9,9)

# import csv  #读取CSV文件
# filepath = 'C:/Users/DELL/Desktop/手势识别/0数据/12.6/train/27/echo_221206--21：56：11_312.csv'
# with open(filepath) as f:
#     reader = csv.reader(f)
#     header_row = next(reader)
#     print(header_row)
    




print('END')