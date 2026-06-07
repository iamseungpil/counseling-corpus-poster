# 상담 경험 코퍼스 포스터 (Counseling Corpus Poster)

한국어 공개 SNS에 기록된 상담 경험을 LLM 보조 정제 절차로 분석한 사례 보고
(`counseling-corpus/reports/paper_kjcp_v2_short`)를 A0 학술 포스터로 정리한 저장소입니다.

[Seungpil_graduation_poster](https://github.com/iamseungpil/Seungpil_graduation_poster)의
gemini 포스터 양식(Anish Athalye, Unofficial University of Cambridge Poster Template)을
따르며, 한국어 렌더링을 위해 폰트를 Noto Sans KR(SIL OFL)로 교체해 `fonts/`에 동봉했습니다.
시스템 폰트에 의존하지 않으므로 macOS · Overleaf · Linux에서 동일하게 빌드됩니다.

## 구성

```
poster.tex                  # 메인 포스터 (A0 portrait, 2단)
beamerthemegemini.sty       # gemini 테마 (Korean 폰트로 수정)
beamercolorthemenott.sty    # nott 색상 테마
figures/
  fig_pipeline.tex          # LLM 보조 4층 정제 절차 (TikZ)
  fig_funnel.tex            # 3,652 → 361 정제 퍼널
  fig_overview.tex          # 경험 극성 · 장면 · 상위 질의군 분포
  fig_process.tex           # 부정 · 긍정 과정 코드 대비
  corpus_funnel.pdf         # 원본 그림 (paper_kjcp_v2_short)
  corpus_overview.pdf
  process_contrast.pdf
tables/
  table_compare.tex         # 면접 자료 vs SNS 자료 비교 표
logos/
  snu_emblem.png            # 서울대학교 엠블럼 (좌측, 배경 투명)
  kca_logo.png              # 한국상담학회 로고 (우측, 배경 투명)
  author_qr.png             # 저자 소개 페이지 QR (julyjlee.github.io/about.html)
fonts/
  NotoSansKR-Regular.otf    # 본문 폰트 (SIL OFL, 동봉)
  NotoSansKR-Bold.otf       # 볼드 폰트 (SIL OFL, 동봉)
  OFL.txt                   # 폰트 라이선스
```

저자: Yunjeong Lee (서울대학교) · 발표: 한국상담학회 학술대회 (2026).
로고는 [서울대 공식 심볼](https://en.snu.ac.kr/about/symbol/ui)과
[한국상담학회](https://www.counselors.or.kr/)의 공개 이미지를 받아 배경을
투명 처리해 사용했습니다.

원본 그림 3종(`corpus_funnel`, `corpus_overview`, `process_contrast`)은
[counseling-corpus](https://github.com/iamseungpil/counseling-corpus)의
`reports/paper_kjcp_v2_short/figures`에서 가져왔습니다.

## 빌드

XeLaTeX만 있으면 됩니다. 한국어 폰트(Noto Sans KR)는 `fonts/`에 동봉되어
경로로 로드되므로 별도 설치가 필요 없습니다.

```bash
make            # latexmk -pdfxe 로 poster.pdf 생성
# 또는
xelatex poster.tex
```

## 내용 요약

- **자료**: 한국어 공개 X(구 트위터) 게시물 3,652건 → 본문 코퍼스 361건
- **정제**: 사전 오염 제거 · 규칙 기반 1차 분류 · LLM 판정 · 보수적 본문 확정 (4층)
- **결과**: 부정 117 · 긍정 126건으로 두 경험이 비슷한 비중으로 공존;
  부정 경험에서는 강제성 · 무시당함 · 상처, 긍정 경험에서는 이해받음 · 안도 · 성장이
  자주 함께 나타남 (부트스트랩 · LLM 비의존 점검에서 안정성 확인)

## 라이선스

포스터 템플릿은 원본 저장소의 라이선스를 따릅니다 (`LICENSE.md`).
