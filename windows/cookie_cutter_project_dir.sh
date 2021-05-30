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
mkdir data doc models notebooks references reports src bin results
touch requirements.txt setup.py tox.ini

cat > .env << EOF
# .env 파일
echo "HELLO autoenv! "
. dev-env/bin/activate
echo "[virtual env is successfully activated!]
EOF

cat > .env.leave << EOF
# .env.leave 파일
echo "BYEBYE@ "
. dev-env/bin/deactivate
echo "[virtual env is successfully deactivated!]"

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
touch __init__.py
mkdir data features models visualization
cd ./data
touch make_dataset.py
cd ../features
touch build_features.py
cd ../models
touch predict_model.py train_model.py
cd ../visualization
touch visualize.py
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
    python3 -m venv dev-env
    python3 -m venv rel-env
    echo "[msg] Virtual-env is successfully created"
} ||
{
    echo "[msg] Cant' create virtual-env"
}
