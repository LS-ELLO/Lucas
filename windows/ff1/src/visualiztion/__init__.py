# 내부 폴더 *.py 파일을 다른 폴더에서 사용 가능하도록 해줌 

import os, sys, inspect

# https://gist.github.com/JungeAlexander/6ce0a5213f3af56d7369
# 상위 폴더 연결하기 

# 지금 폴더 & 부모 폴더 가져오기 
current_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
parent_dir = os.path.dirname(current_dir)
sys.path.insert(0, parent_dir) 
dirnames = os.listdir(parent_dir)   ## 부모 폴더내에 서브 폴더 가져 오기 
dirnames= [i for i in dirnames if ("." not in i)]   ## 폴더 이름만 가져오기 (.py, .zip, .ds 형식 제외 )
userpaths = [os.path.join(parent_dir, dirname) for dirname in dirnames] ## 서브 폴더의 완전한 주소 만들기 
syspaths = sys.path ## 시스템 패스 정보 
for userpath in userpaths:  ## User 패스 등록하기 
    if userpath in syspaths:
        pass
    else:
        sys.path.append(userpath)
