# 실행 파일에 꼭 아래의 코드가 포함 되어 있어야함 ( 콘솔에서 다른 폴더 파일 불러 올 수 있음)

import os
import sys
import inspect

# # 프로젝트 폴더의 모든 폴더 sys.path 걸기
# # https://gist.github.com/JungeAlexander/6ce0a5213f3af56d7369
# # 부모 폴더 연결하기 --> 꼭필요 !!!!
current_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
parent_dir = os.path.dirname(current_dir)
sys.path.insert(0, parent_dir)
