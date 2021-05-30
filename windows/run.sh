#!/usr/bin/env bash

## 실행 명령어: bash run.sh . test.py

# don't overwrite files.
set -o noclobber
echo "[msg] **Don't overwrite files**"

[ $# -lt 2 ] && { echo "Usage: $0 [target directory] [target.py]"; exit 1; }

if [ ! -d "$1" ]; then # -d FILE : FILE이 디렉토리 이면 참(true)
    mkdir $1
fi # end if

cd $1

# 쉘 스크립트 내에서 실행되는 source 명령어는 쉘이라는 껍데기에서 한번 감싸진 상태에서 실행되는 것이기 때문에 
# 우리가 source venv/bin/activate 했을 때처럼 (venv) Myang-MacBook-Pro 이렇게 앞에 가상환경 상태임을 나타내는 표시가 따로 생성되지 않는다. 
# 엄밀하게 말하면 쉘에 싸여있기 때문에 쉘 바깥 터미널에서 그걸 실행시키는 나에겐 보이지 않는다고 봐도 좋겠다. (https://m.blog.naver.com/asianchairshot/221393818096)
{
    source dev-env/bin/activate
    echo "[msg] Successfully execute virtual-env"
} ||
{
    echo "[msg] Cant' execute virtual-env"
}


echo "[msg] Executing your python file.."

{
    pip3 install --upgrade pip
    pip3 install -r requirements.txt
    pip3 list
    python3 $2
    echo "[msg] Successfully execute python file"
} ||
{
    echo "[msg] Cant' execute python file"
}
