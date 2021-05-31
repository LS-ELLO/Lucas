#!/usr/bin/env bash

## 실행 명령어: bash cookie_cutter_project_dir.sh /directory/to/where/your/project/is

# don't overwrite files.
set -o noclobber
echo "[msg] **Don't overwrite files**"

# Exit if no arguments were provided.
# $# : 스크립트에 넘겨진 인자의 개수
# ex) ./test.sh a1 a2 a3 a4 이면, $# 의 값은 4

#echo $#
[ $# -lt 1 ] && { echo "Usage: $0 [target directory] [project name]"; exit 1; }

# the first argument passed into the script should be the dir
# where you want the folder structure setup

echo "[msg] Setting up... folder structure in $1"

if [ ! -d "$1" ]; then # -d FILE : FILE이 디렉토리 이면 참(true)
    mkdir $1
fi # end if

cd $1
mkdir $2

cd $2
mkdir data docs models notebooks references reports src App
touch requirements.txt setup.py

cat > LICENSE << EOF
EOF

cat > Makefile << EOF
echo "Makefile with commands like `make data` or `make train`" > README.md
EOF

cat > .gitignore << EOF
# Node packages
node_modules/

# Mac OS-specific storage files
.DS_Store
EOF

cat > .env << EOF
# .env 파일
echo "HELLO autoenv"
{
    source .dev-venv/bin/activate
    echo "virtual env is successfully activated!"
} ||
{
    echo "[virtual env start] is failed!"
}
EOF

cat > .env.leave << EOF
# .env.leave 파일
echo "BYEBYE"
{
    deactivate
    echo "virtual env is successfully deactivated!"
} ||
{
    echo "[virtual env quit] is failed!"
}
EOF

cd ./data
echo "Data directory for storing fixed data sets" > README.md
mkdir external interim processed raw
cd ./external
echo "Data from third party sources." > README.md
cd ../interim
echo "Intermediate data that has been transformed." > README.md
cd ../processed
echo "The final, canonical data sets for modeling." > README.md
cd ../raw
echo "The original, immutable data dump." > README.md
touch .gitkeep

cd ../../docs
echo "A default Sphinx project; see sphinx-doc.org for details" > README.md
touch .gitkeep

cd ../models
echo "Trained and serialized models, model predictions, or model summaries" > README.md
touch .gitkeep

cd ../notebooks
echo "upyter notebooks. Naming convention is a number (for ordering) the creator's initials, and a short `-` delimited description, e.g.
`1.0-jqp-initial-data-exploration`." > README.md
touch .gitkeep

cd ../references
echo "Data dictionaries, manuals, and all other explanatory materials" > README.md
touch .gitkeep

cd ../reports
echo "Generated analysis as HTML, PDF, LaTeX, etc." > README.md
mkdir figures
cd ./figures
echo "Generated graphics and figures to be used in reporting" > README.md
touch .gitkeep

cd ../../src
echo "Source code for use in this project." > README.md
touch .gitkeep
mkdir dataread features models visualiztion
cd ./dataread
cat > __init__.py << EOF
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
EOF
cat > example.py << EOF
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
EOF
cd ../features
cat > __init__.py << EOF
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
EOF
cat > example.py << EOF
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
EOF
cd ../models
cat > __init__.py << EOF
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
EOF
cat > example.py << EOF
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
EOF
cd ../visualiztion
cat > __init__.py << EOF
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
EOF
cat > example.py << EOF
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
EOF

cd ../../App
echo "App for mobile" > README.md
touch .gitkeep
mkdir android ios lib 
cd ./android 
touch .gitkeep
cd ../ios 
touch .gitkeep
cd ../lib 
touch main.py 
mkdir models 
cd ./models 
touch .gitkeep

cd ../../../

# 메인 README 생성
cat > README.md << EOF
#cookie-cutter-for-your-project
프로젝트 폴더 구성을 세팅하기 위하여 cookie cutter (aka. project template)를 사용합니다.
cookie cutter를 통해서 프로젝트를 구성하는데 표준의 폴더 구조를 쉽고 빠르게 설정할 수 있습니다.
EOF
echo "[msg] Top-level README.md created"

# try ~ catch
{
    python3 -m venv .dev-venv
    python3 -m venv .deploy-venv
    echo "[msg] Virtual-env is successfully created"
} ||
{
    echo "[msg] Cant' create virtual-env"
}
