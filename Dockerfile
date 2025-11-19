FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime
# 작업 폴더 설정
WORKDIR /workspace

# 1. 필수 패키지 설치 (git, curl 등)
RUN apt-get update && apt-get install -y git

# 2. 파이썬 라이브러리 설치
# transformers: 모델 불러오기
# accelerate: 모델 로딩 속도 최적화
# matplotlib, seaborn: 시각화 (그림 그리기)
# sentencepiece, protobuf: 토크나이저 관련 필수
RUN pip install jupyterlab transformers accelerate matplotlib seaborn sentencepiece protobuf ipywidgets

# 3. JupyterLab 실행 (비밀번호 없이 접속)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]