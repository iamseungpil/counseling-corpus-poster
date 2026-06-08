# 2026 한국상담학회 공식 템플릿 포스터 (LaTeX 이식)

학술위원회 배포 PPTX 템플릿(`assets/official_template.pptx`)을 LaTeX로 옮긴 버전입니다.
배경 디자인은 한 치의 차이도 없이 동일하고, 본문만 연구 내용으로 채웠습니다.

## 이식 방식

1. **배경 (디자인 100% 동일)** — PPTX 템플릿 슬라이드에서 *채움용 안내 텍스트*
   (`논문명 기재`, `이름(소속)`, `~작성해주시기 바랍니다` 6개)만 제거하고 나머지
   고정 요소(헤더 밴드, 흰 본문 패널, 섹션 바 `I.서론`~`V.논의`, 소제목
   `1.연구의 필요성`/`2.연구목표`, 하단 KCA 로고)는 그대로 둔 채 렌더 →
   `assets/template_bg.png`. 이 이미지를 전면 배경으로 깔았습니다.
2. **본문 배치** — 원본 PPTX의 각 텍스트 상자 좌표(EMU→mm)를 그대로 읽어
   `textpos`로 절대 위치에 올렸습니다. 섹션 구조도 템플릿과 동일:
   - I. 서론 (1. 연구의 필요성 / 2. 연구목표)
   - II. 이론적 배경
   - III. 연구방법
   - IV. 연구결과
   - V. 논의
3. **내용** — `counseling-corpus/reports/paper_kjcp_v2_short`의 각 섹션을
   템플릿 칸 크기에 맞게 압축했고, 모든 수치·통계·인용은 원논문과 동일합니다
   (별도 충실도 감사로 확인).

## 두 가지 산출물

1. **`poster_kca.tex` → `poster_kca.pdf`** — LaTeX 판 (배경 이미지 + textpos 오버레이)
2. **`poster_kca_template.pptx`** — 공식 PPTX 양식에 내용을 그대로 채운 완성본
   (`fill_pptx.py`로 생성). PowerPoint에서 바로 열어 수정 가능.

## 폰트 · 크기 · 위치 분석 (원본 PPTX에서 추출)

원본 템플릿의 글꼴·크기·색·좌표를 그대로 분석해 맞췄다.

| 요소 | 글꼴 | 크기(pt) | 색 | 비고 |
|---|---|---|---|---|
| 제목 | 맑은 고딕 | 138 | 짙은 회색 | 본 논문 제목이 길어 LaTeX는 80pt로 맞춤(한 줄 고정) |
| 저자 | 맑은 고딕 Bold | 48 | 2C2C2C | |
| 섹션 라벨 (I~V) | 맑은 고딕 Bold | 60 | 2C2C2C | 배경에 포함(고정) |
| 소제목 (1·2) | 맑은 고딕 | 48 | 2C2C2C | 배경에 포함(고정) |
| 본문 | 맑은 고딕 | 40 (방법 34) | 2C2C2C | 실제 내용이 안내문보다 길어 박스에 맞게 축소 |

- **글꼴**: 원본은 *맑은 고딕*. PPTX 판은 맑은 고딕 그대로(PowerPoint에서 정확히 표시).
  LaTeX 판은 맑은 고딕이 비독점 배포 불가라, 가장 가까운 **Noto Sans KR**(동봉)로 맞추고,
  배경의 섹션·소제목 라벨도 동일하게 Noto Sans KR로 재렌더해 본문과 글꼴을 일치시켰다.
- **크기**: 제목·저자·섹션·소제목은 원본 크기에 맞췄다. 본문만, 안내용 한 줄짜리
  자리표시자보다 실제 연구 내용이 훨씬 길어 박스를 넘지 않는 최대 크기(LaTeX 28pt /
  PPTX 23~26pt)로 잡았다. 좌표(위치)는 원본 EMU 값을 mm로 변환해 그대로 사용했다.
- **색**: 본문 `2C2C2C` (원본 동일).

## 빌드

```bash
cd kca
xelatex poster_kca.tex      # 배경 위치 확정을 위해 2회 실행
python3 fill_pptx.py        # PPTX 완성본 재생성 (python-pptx 필요)
```

- LaTeX 폰트: 상위 `../fonts/`의 Noto Sans KR (동봉)
- 그림: `assets/fig/*.png` (원본 PDF 래스터화), 표는 본문 인라인/네이티브 표
- 출력: `poster_kca.pdf`, `poster_kca_template.pptx` (A0 841×1189mm)

## 파일

```
poster_kca.tex                 # LaTeX 메인 (배경 + textpos 오버레이)
poster_kca.pdf                 # LaTeX 출력
poster_kca_template.pptx       # PPTX 완성본 (양식에 내용 채움)
fill_pptx.py                   # PPTX 채움 스크립트 (python-pptx)
assets/template_bg.png         # 채움 텍스트만 제거한 공식 템플릿 배경(Noto 재렌더)
assets/template_reference.png  # 원본 템플릿 렌더(안내 텍스트 포함, 대조용)
assets/official_template.pptx  # 학술위원회 배포 원본 PPTX
assets/fig/*.png               # 그림(퍼널·분포·과정코드) 래스터본
```
