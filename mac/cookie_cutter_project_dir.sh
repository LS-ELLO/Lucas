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
mkdir data doc models notebooks references reports src bin results application
touch requirements.txt setup.py tox.ini

cat > .gitignore << EOF
# .py, .ipynb만 업로드 되도록 아래에 작성

EOF

cat > .env << EOF
# .env 파일
echo "HELLO autoenv"
{
    source dev-env/bin/activate
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
    source dev-env/bin/deactivate
    echo "virtual env is successfully deactivated!"
} ||
{
    echo "[virtual env quit] is failed!"
}
EOF

cd ./data
mkdir external interim processed raw
echo "Data directory for storing fixed data sets" > README.md
touch .gitkeep

cd ../doc
echo "Doc directory with one subdirectory per manuscript" > README.md
touch .gitkeep

cd ../models
echo "models" > README.md
touch .gitkeep

cd ../notebooks
echo "notebooks" > README.md
touch .gitkeep

cd ../references
echo "references" > README.md
touch .gitkeep

cd ../reports
mkdir figures
echo "reports" > README.md
touch .gitkeep

cd ../src
mkdir p0data p1dataread p2features p3models p4visualiztion utils
cd ./p0data
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
cd ../p1dataread
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
cd ../p2features
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
cd ../p3models
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
cd ../p4visualiztion
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
cd ../utils
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
cd ..
echo "src for source code" > README.md
touch .gitkeep

cd ../bin
echo "bin for compiled binaries or scripts" > README.md
touch .gitkeep

cd ../results
echo "Results directory for tracking computational experiments peformed on data" > README.md
touch .gitkeep

echo "[msg] Folders created."

cd ..

# 메인 README 생성
cat > README.md << EOF
#cookie-cutter-for-your-project
프로젝트 폴더 구성을 세팅하기 위하여 cookie cutter (aka. project template)를 사용합니다.
cookie cutter를 통해서 프로젝트를 구성하는데 표준의 폴더 구조를 쉽고 빠르게 설정할 수 있습니다.

## 역할
\`cookie_cutter_project_dir.sh\` 스크립트는 아래와 같은 폴더 구조를 생성합니다:

    폴더 구조
    ├── LICENSE
    ├── README.md          ← The top-level README for developers using this project.
    ├── bin                ← bin.
    ├── data
    │   ├── external       ← Data from third party sources.
    │   ├── interim        ← Intermediate data that has been transformed.
    │   ├── processed      ← The final, canonical data sets for modeling.
    │   └── raw            ← The original, immutable data dump.
    │
    ├── doc                ← documentation
    │
    ├── models             ← Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          ← Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         ← Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            ← Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        ← Generated graphics and figures to be used in reporting
    │
    ├── results            ← results.
    │
    ├── requirements.txt   ← The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           ← makes project pip installable (pip install -e .) so src can be imported
    ├── src                ← Source code for use in this project.
    │   ├── __init__.py    ← Makes src a Python module
    │   │
    │   ├── data           ← Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       ← Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         ← Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  ← Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini            ← tox file with settings for running tox; see tox.readthedocs.io
EOF
echo "[msg] Top-level README.md created"

# try ~ catch
{
    python3 -m venv .dev-env
    python3 -m venv .rel-env
    echo "[msg] Virtual-env is successfully created"
} ||
{
    echo "[msg] Cant' create virtual-env"
}
