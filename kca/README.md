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

## 빌드

```bash
cd kca
xelatex poster_kca.tex   # 배경 위치 확정을 위해 2회 실행 권장
```

- 폰트: 상위 `../fonts/`의 Noto Sans KR (동봉)
- 그림/표: 상위 `../figures/`, 표는 본문에 인라인
- 출력: `poster_kca.pdf` (A0 841×1189mm)

## 파일

```
poster_kca.tex              # 메인 (배경 + textpos 오버레이)
assets/template_bg.png      # 채움 텍스트만 제거한 공식 템플릿 배경
assets/template_reference.png  # 원본 템플릿 렌더(안내 텍스트 포함, 대조용)
assets/official_template.pptx  # 학술위원회 배포 원본 PPTX
```
