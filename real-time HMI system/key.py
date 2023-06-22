# 控制鼠标移动（绝对位置）
import pyautogui
def key(x):

    if 0<=x<=9:
        pyautogui.press(str(x))

    elif x==11:
        pyautogui.press('Z')
    elif x==12:
        pyautogui.press('J')
    elif x==13:
        pyautogui.press('U')
    elif x==21:
        pyautogui.press('left')
    elif x==22:
        pyautogui.press('right')
    elif x==24:
        pyautogui.scroll(up)
    else:
        pyautogui.click()


 