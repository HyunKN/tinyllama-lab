# TinyLlama: "Attention Is All You Need" Inspection Lab 🔬

이 프로젝트는 2017년 Vaswani et al.이 발표한 논문 **["Attention Is All You Need"](https://arxiv.org/abs/1706.03762)**의 핵심 아키텍처인 **Transformer**의 동작 원리를, **TinyLlama-1.1B** 모델을 통해 시각적으로 검증하고 분석하는 연구소입니다.

## 🎯 Project Goal & Motivation
- **Why TinyLlama?**: 논문의 Transformer 구조 중 **Decoder-only** 아키텍처(GPT 계열)를 따르면서도, RTX 2060(6GB) 환경에서 전체 레이어 분석이 가능한 최적의 모델입니다.
- **Core Mission**: 블랙박스처럼 여겨지는 LLM 내부의 **Query, Key, Value ($Q, K, V$)** 상호작용을 시각화하여, 논문의 수식이 실제 코드에서 어떻게 발현되는지 증명합니다.

## 🛠️ Environment Setup
- **GPU**: NVIDIA GeForce RTX 2060 (6GB VRAM) - *CUDA Core 가속 활성화*
- **Container**: Docker (WSL2)
- **Base Image**: PyTorch 2.2.2 + CUDA 12.1
- **Library**: Hugging Face Transformers, Seaborn (Visualization)

## 📚 Curriculum & Roadmap (Paper Mapping)

### Phase 1: Scaled Dot-Product Attention (Section 3.2.1)
- **목표**: 논문의 핵심 수식 $Attention(Q, K, V) = softmax(\frac{QK^T}{\sqrt{d_k}})V$ 시각화 / (attention_matrix에 들어있는 값들(0.2555 같은 숫자))
- **활동**: JupyterLab에서 토큰 간의 연관성(Heatmap)을 추출하여, 단어 사이의 '유사도'가 어떻게 계산되는지 확인.

### Phase 2: Masked Multi-Head Attention (Section 3.2.2)
- **목표**: 생성형 모델(Decoder)의 특징인 **Causal Masking** 검증.
- **활동**: 히트맵에서 **삼각형 패턴(Upper Triangular Mask)**이 나타나는 이유 분석. (미래의 단어를 미리 보지 못하게 하는 원리 규명)

### Phase 3: Multi-Head Dynamics
- **목표**: "Multi-Head"의 의미 이해.
- **활동**: 서로 다른 Head(예: Head 0 vs Head 10)가 같은 문장에서 서로 다른 문법적/의미적 요소에 주목하고 있음을 비교 분석.

---
*Created by [HyunKN] on Micro-AI Lab*
