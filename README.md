# cookie-cutter-dx-team
_Last Updated: 2021-05-031_

coded by linux shell

* autoenv (for mac)
* ps-autoenv (for windows)

<br><br>

## Requirements
* python 3.xx

<br><br>

## ***autoenv (for mac)***

>🚫<b>주의</b>️ <br>
>`$> brew install autoenv` 로 다운로드 받아서 실행시키면 터미널 고장납니다. <br>
>반드시 [autoenv Github](https://github.com/inishchith/autoenv) 에서 git clone 으로 다운받아 주세요. (현재 시점 21.3.24)

>⚠️mac버전만 소개합니다.

### ✔How to Install autoenv
```bash
$ git clone git://github.com/inishchith/autoenv.git ~/.autoenv
```

#### 🔵폴더 진입 시, activate 구현하기

```bash
$ echo 'source ~/.autoenv/activate.sh' >> ~/.zshrc
$ source ~/.zshrc
```
<br>

🔔하단의`.env`파일은 현재 repo의 cookiecutter에서 자동으로 생성해줍니다. (스킵)
```sh
# .env 파일
echo "HELLO autoenv"
{
    source .dev-env/bin/activate
    echo "virtual env is successfully activated!"
} ||
{
    echo "[virtual env start] is failed!"
}
```
`.env`파일 설정 후 첫 폴더 진입시 `.env`파일을 신뢰하고 실행할지 않을 지에 대한 동의가 나타납니다.
![autoenv](https://d1sr4ybm5bj1wl.cloudfront.net/img/dropbox/Screenshot%202017-07-16%2017.44.52.png)
이 부분은 `.env`파일이 악의적으로 변경되었을때 사용자에게 알리기 위해서 있기 때문에 즐거운 마음으로 Y를 눌러줍시다. <br>
이제 정상적으로 가상환경이 `activate`된 것을 확인할 수 있습니다. 

#### 🔴폴더 탈출 시, deactivate 구현하기

```bash
$> vi ~/.zshrc
```
마지막줄에 다음의 명령어를 추가해줍니다.

```sh
export AUTOENV_ENABLE_LEAVE='"enabled"' 
```
<br>

🔔 하단의`.env.leave`파일은 현재 repo의 cookiecutter에서 자동으로 생성해줍니다. (스킵)
```sh
# .env.leave 파일
echo "BYEBYE"
{
    source .dev-env/bin/deactivate
    echo "virtual env is successfully deactivated!"
} ||
{
    echo "[virtual env quit] is failed!"
}
```
`.env.leave`파일 설정 후 해당 폴더에서 나가면<br>
정상적으로 가상환경이 `deactivate` 되는 것을 확인할 수 있습니다.

### ✔️How to Use

```zsh
$> cd where-you-want
$> git clone https://git.lsis.com/ympark4/cookiecutter-data-science.git
$> cd cookiecutter-data-science
$> cd mac

$> bash cookie_cutter_project_dir.sh where-you-want your-project-name
ex. $> bash cookie_cutter_project_dir.sh . 1bot
```

<br><br>

## ***ps-autoenv (for windows)***
>도움 주신 규본님 감사합니다. <br>
[ps-autoenv](https://github.com/nickcox/ps-autoenv)를 사용합니다.

### ✔How to install ps-autoenv
<b>Powershell</b> 실행
```console
PS> Install-Module ps-autoenv
PS> Add-Content $PROFILE @("`n", "import-module ps-autoenv")
```

### ✔How Use
<b>Git Bash</b> 실행
```console
bash> cd "where-this-repo-downloaded"
bash> cd windows
bash> bash cookie_cutter_project_dir.sh where-you-want your-project-name
ex. bash> bash cookie_cutter_project_dir.sh . 1bot
```

<b>Powershell</b> 실행
```console
PS> Import-Module ps-autoenv
PS> cd "where-your-cookiecutter-project"
ex. PS> cd "C:\Users\ympark4\Documents\1bot"
PS> press 'Y'
```


<br><br>

## The resulting directory structure

The directory structure of your new project looks like this:

```
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
│   ├── p0data         ← Scripts to download or generate data
│   │   └── __init__.py
│   │   └── example.py
│   │
│   ├── p1dataread     ← Scripts to download or generate data
│   │   └── __init__.py
│   │   └── example.py
│   │
│   ├── p2features     ← Scripts to download or generate data
│   │   └── __init__.py
│   │   └── example.py
│   │
│   ├── p3models     ← Scripts to download or generate data
│   │   └── __init__.py
│   │   └── example.py
│   │
│   ├── p4visualization    ← Scripts to download or generate data
│   │   └── __init__.py
│   │   └── example.py
│   │
│   └── utils        ← Scripts to create exploratory and results oriented visualizations
│       └── __init__.py
│       └── example.py
│
└── tox.ini            ← tox file with settings for running tox; see tox.readthedocs.io
```

<br><br>

## TODO
* ~~Windows에 autoenv설정 (규본님 메시지 참조)~~
* cookiecutter 파이썬 버전별로 가상화경 선택할 수 있는 기능 추가 (상욱님 지시사항)
