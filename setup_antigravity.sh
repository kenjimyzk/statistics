#!/bin/bash

# 1. 魂 (gemini.md) の作成：専門知を物語に変える「知の伴走者」
cat << 'EOF' > gemini.md
# Global Context: "Sora" (経済学エデュケーショナル・ライター)

## 1. Identity & Role (アイデンティティと役割)
* 名前: そら
* 役割: 経済学専門の学術ライター 兼 編集アシスタント
* ミッション: Quarto (.qmd) を基盤に、数理的厳密さと図解による直感を両立させ、文系学生が「自らデータを動かして理解できる」教科書を編集長（ユーザー）と共に制作する。

## 2. Core Values (行動指針)
1. Visual-Logical Clarity: 文章、数式、図解を三位一体で提示し、視覚的な直感から論理的な理解へ導く。
2. Reproducible Insights: 理論図解（Mermaid）からデータ可視化（ggplot2等）まで、すべて再現可能なコードとして .qmd 内に保持する。
3. User as Editor-in-Chief: ユーザーは「編集長」。高度な専門知見を受け取り、教育的効果を最大化する図解配置と執筆を提案する。

## 3. Writing Guidelines (執筆ガイドライン)
* 形式: 原則として Quarto Markdown (.qmd) 形式で出力。
* 文体: 「〜です・ます」調（学生に寄り添う知的なトーン）。
* 強調: 日本語の太字（**）は原則使用せず、見出し、リスト、文脈によって構造化する。
* 図表の配置: 各セクションに必ず1枚以上の図表を提案し、クロスリファレンス（@fig-label）で本文と紐付ける。

## 4. Operational Workflow (執筆プロセス)
1. Phase 1: Idea (/idea): 学習目標と視覚的コンセプトの提案。
2. Phase 2: Book Outline (/book-outline): 書籍全体の章立て設計。
3. Phase 3: Chapter Outline (/chapter-outline): 章内の節構成と、図解予定箇所のマッピング。
4. Phase 4: Drafting (/draft): 本文執筆と「図解アイディア（メモ）」の記入。
5. Phase 5: Visual Asset Generation (/visual): メモに基づいた Mermaid/R/Python コードの生成。
6. Phase 6: Review (/review): 整合性とレンダリング結果の最終点検。
EOF

# 2. ディレクトリ作成
mkdir -p .agent/rules .agent/workflows .agent/skills/r_japanese_font_setup

# 3. 執筆スタイル (writing_style.md) の作成
cat << 'EOF' > .agent/rules/writing_style.md
---
trigger: always_on
---

# Rule: Economics Textbook Writing Style (Visual & Quarto Native)

## 1. Scope (適用範囲)
* 執筆タスク、および /draft, /visual コマンド実行時の .qmd 執筆。

## 2. Basic Stance (基本姿勢)
* Persona: 「そら」人格を継承。
* Visual First: 「図1枚で概念を説明するなら？」という視点を常に持ち、各セクションに必ず1枚以上の図解（概念図・グラフ）を提案する。
* Integration: 図表は Quarto の機能（fig-cap, label）を使い、本文から適切に参照する。

## 3. Constraints & Taboos (制約・禁止事項)
* 太字強調の禁止: 文脈で重要性を伝え、安易な太字に頼らない。
* 孤立した図の禁止: 図を挿入する際は、必ず本文中でその図が示す経済学的意味を解説する。
* 非再現的な図の禁止: 概念図は Mermaid、データ図は R/Python のコードチャンクで記述し、後からの修正を容易にする。

## 4. Output Format (納品形式)
* .qmd 形式。
* 各セクションの末尾、または図表挿入予定位置に、以下のような「図解メモ」を残すこと。
  - [Visual Idea: ここに〇〇の因果関係を示すフロー図（Mermaid）を挿入予定。ターゲットは〜]
  - [Visual Idea: Positronで〇〇データを読み込み、散布図を表示するコードチャンク。強調点は〜]
EOF

# 4. 執筆ワークフロー (textbook-create.md) の作成
cat << 'EOF' > .agent/workflows/textbook-create.md
---
description: 執筆と図解設計をシームレスに繋ぐ、経済学教科書の制作フロー
---

---
# Textbook Creation Workflow (Integrated)

## Step 1: Idea (/idea)
* Action: 章のテーマと、主眼となる「視覚的メタファー」を提案。

## Step 2: Book Outline (/book-outline)
* Action: 書籍全体の qmd ファイル構成とストーリーラインを定義.

## Step 3: Chapter Outline (/chapter-outline)
* Action: 節構成を作成し、図表を挿入すべき位置をあらかじめ予約する。

## Step 4: Drafting (/draft)
* Action: .qmd 形式で本文を執筆。
* Key Action: 執筆中に「図が必要な箇所」へ具体的な図解アイディアを [Visual Idea: ...] 形式で書き込む。これが Step 5 の設計図となる。

## Step 5: Visual Asset Generation (/visual)
* Action: Step 4 のメモをスキャンし、Mermaidコードや、ggplot2等を用いた実行可能なコードチャンクに変換して .qmd を完成させる。

## Step 6: Review (/review)
* Action: 文章、数式、図解、コード実行結果が一体となって機能しているか最終確認。
EOF

# 5. 執筆スキル (writer-skill.md) の作成
cat << 'EOF' > .agent/skills/writer-skill.md
---
name: Economics Writer Skill
description: 文章と図解の連動性を高めるための執筆テクニック集
---

# Economics Writer Skills

## 1. 説明の型 (The Metaphor-to-Visual Bridge)
抽象的な経済概念を比喩で説明した後、その比喩を視覚化する。
* 比喩：「DNSはインターネットの電話帳」
* 図解アイディア：ユーザー、DNSサーバー、Webサーバーのやり取りを時系列（Sequence Diagram）で図解。

## 2. 執筆中の図解ストック (Drafting-time Visual Hook)
本文執筆中に論理が複雑になったら、その場で次ステップのためのメモを残す。
* 数式の変形が続く：[Visual Idea: 各変数の意味と変化の方向を対応させた構造図]
* データの傾向を語る：[Visual Idea: ggplot2 を使い、信頼区間を含めたトレンドラインの描画]

## 3. Quarto を活かした視覚化
* Mermaid: 経済主体の意思決定プロセスや、政策の波及経路（Transmission Mechanism）の視覚化。
* Code Chunks: 学生が Positron 上で数値を書き換えて「感度分析」ができるような、インタラクティブなコードの提示。
EOF

# 6. R日本語フォント設定スキル (r_japanese_font_setup/SKILL.md) の作成
cat << 'EOF' > .agent/skills/r_japanese_font_setup/SKILL.md
---
description: Resolve Japanese character rendering issues in R (ggplot2) on macOS
---

# R (ggplot2) Japanese Font Setup on macOS

macOS 上で ggplot2 を用いたプロットを Quarto でレンダリングする際、日本語が「フォントタイプが不正です」エラーで描画に失敗することがある。以下の手順で解決する。

## 1. Quarto プロジェクト設定（最重要）

`_quarto.yml` に `ragg_png` グラフィックスデバイスを指定する。`ragg` は macOS のシステムフォントを正しく認識できるため、フォントエラーの根本原因を解消する。

```yaml
# _quarto.yml
knitr:
  opts_chunk:
    dev: "ragg_png"
```

`ragg` および `magick` パッケージが未インストールの場合は事前にインストールする。`magick` は `ragg_png` 使用時の画像加工（余白削除など）に必要となる場合がある。

```r
install.packages(c("ragg", "magick"))
```

## 2. グローバルテーマ設定

各 `.qmd` ファイルの `setup` チャンクで、テーマのベースフォントに `"Hiragino Sans"` を指定する。

```r
#| label: setup
#| include: false
library(tidyverse)
# 日本語フォント設定 (macOS)
theme_set(theme_minimal(base_family = "Hiragino Sans"))
```

注意: `"HiraKakuProN-W3"` は標準の `png` デバイスでは動作するが、一部環境で不安定。`ragg_png` + `"Hiragino Sans"` の組み合わせが最も安定する。

## 3. 明示的なフォント指定（確実な方法）

グローバル設定が別の `theme_*()` 呼び出しで上書きされる場合、各プロット内で明示的に指定する。

```r
ggplot(data, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "日本語タイトル", x = "X軸ラベル", y = "Y軸ラベル") +
  theme_minimal(base_family = "Hiragino Sans")
```

## 4. annotate() のフォント指定

`annotate("text", ...)` を使う場合、`family` 引数でフォントを明示的に指定する。グローバルテーマ設定は `annotate()` には適用されないため、これを怠ると日本語テキストでエラーになる。

```r
annotate("text", x = 0, y = 0, label = "注釈テキスト",
         color = "red", family = "Hiragino Sans")
```

## 5. Quarto Book のチャプター番号制御

Quarto book プロジェクトで「はじめに」等の章を番号なしにする場合、YAML の `unnumbered: true` ではなく、本文中に `{.unnumbered}` クラスを付けた h1 見出しを使用する。

```markdown
# はじめに {.unnumbered}
```

また、`_quarto.yml` の `part:` タイトルには手動番号（「第1部：」等）を含めない。Quarto が自動で Part I, Part II... を付与するため、手動番号と二重になる。

```yaml
# 正しい例
- part: "統計学の「感覚」を取り戻す"

# 間違い（二重番号になる）
- part: "第1部：統計学の「感覚」を取り戻す"
```

## 6. フォント候補一覧

macOS で使用可能な日本語フォント（優先順）:

1. `"Hiragino Sans"` — 推奨。ragg_png と最も相性が良い
2. `"HiraKakuProN-W3"` — 標準 png デバイスでは動作するが ragg との相性に注意
3. `"Hiragino Kaku Gothic ProN"` — 代替
4. `"AppleGothic"` — 最終手段
EOF

# 7. プロジェクト構成ファイル (_quarto.yml) の作成
cat << 'EOF' > _quarto.yml
project:
  type: book
  output-dir: docs

execute:
  cache: true  # CRITICAL: Cache Python execution for faster rendering
  freeze: auto

book:
  title: "「安いニッポン」の最終章"
  subtitle: "金利ある世界で生き残る経済学"
  author: "栞（しおり）"
  date: "2026-02-09"
  chapters:
    - index.qmd
    - part: "パラダイムシフトの衝撃"
      chapters:
        - 01_chapter1.qmd
        - 02_chapter2.qmd
        - 03_chapter3.qmd
    - part: "家計と企業の生存戦略"
      chapters:
        - 04_chapter4.qmd
        - 05_chapter5.qmd
        - 06_chapter6.qmd
        - 07_chapter7.qmd
    - part: "日本経済の深層と未来"
      chapters:
        - 08_chapter8.qmd
        - 09_chapter9.qmd
        - 10_chapter10.qmd

format:
  html:
    theme: flatly
    css: styles.css
    toc: true
    number-sections: true
    highlight-style: github
    lang: ja
  docx:
    toc: true
    number-sections: true
    highlight-style: github
  pdf:
    pdf-engine: lualatex
    documentclass: bxjsbook
    classoption: [lualatex, ja=standard, 10pt, a4paper, textwidth-limit=50, openany]
    toc: true
    number-sections: true
    mainfont: "Hiragino Sans"
    keep-tex: true

knitr:
  opts_chunk:
    dev: "ragg_png"
EOF

# 8. スタイルシート (styles.css) の作成
cat << 'EOF' > styles.css
/* Body & Typography */
body {
  font-family: "Hiragino Sans", "Hiragino Kaku Gothic ProN", "BIZ UDPGothic", "Meiryo", sans-serif;
  line-height: 1.9;
  color: #2c3e50;
  margin: 0;
  padding: 0;
  font-feature-settings: "palt";
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 700;
  margin-top: 2.5em;
  margin-bottom: 1em;
  color: #2c3e50;
  line-height: 1.4;
}

h1 {
  font-size: 2.4em;
  border-bottom: 3px solid #3498db;
  padding-bottom: 0.4em;
  margin-bottom: 1.5em;
}

h2 {
  font-size: 1.8em;
  background-color: #f8f9fa;
  border-left: 6px solid #e74c3c;
  padding: 0.5em 0.8em;
  border-radius: 0 4px 4px 0;
}

h3 {
  font-size: 1.4em;
  border-bottom: 1px dashed #bdc3c7;
  padding-bottom: 0.3em;
}

p {
  margin-bottom: 1.8em;
  text-align: justify;
}

strong {
  background: linear-gradient(transparent 70%, #f1c40f 70%);
  padding: 0 2px;
  font-weight: bold;
}

/* Links */
a {
  color: #2980b9;
  text-decoration: none;
  transition: all 0.3s ease;
  border-bottom: 1px dotted #2980b9;
}

a:hover {
  color: #e74c3c;
  border-bottom: 1px solid #e74c3c;
}

/* Blockquotes */
blockquote {
  border-left: 5px solid #95a5a6;
  padding: 15px 25px;
  margin: 30px 0;
  background-color: #f4f6f7;
  font-style: italic;
  color: #555;
  border-radius: 4px;
}

/* Code Blocks */
pre {
  background-color: #282c34;
  color: #abb2bf;
  border-radius: 6px;
  padding: 20px;
  overflow-x: auto;
  font-size: 0.95em;
  font-family: "Fira Code", Consolas, Monaco, monospace;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

code {
  background-color: rgba(27, 31, 35, 0.05);
  padding: 0.2em 0.4em;
  border-radius: 3px;
  color: #e74c3c;
  font-family: "Fira Code", Consolas, Monaco, monospace;
}

pre code {
  color: inherit;
  background-color: transparent;
  padding: 0;
}

/* Tables */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin: 3em 0;
  box-shadow: 0 2px 15px rgba(0,0,0,0.05);
  border-radius: 8px;
  overflow: hidden;
}

th, td {
  padding: 15px 20px;
  text-align: left;
  border-bottom: 1px solid #eee;
}

th {
  background-color: #34495e;
  font-weight: bold;
  color: #fff;
  text-transform: uppercase;
  font-size: 0.9em;
  letter-spacing: 0.05em;
}

tr:nth-child(even) {
  background-color: #fcfcfc;
}

tr:hover {
  background-color: #f1f8ff;
}

/* Callouts (Quarto Specific) */
.callout {
    margin-top: 2rem;
    margin-bottom: 2rem;
    border-radius: 6px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    border-left-width: 6px !important; 
}

/* Figures */
figure {
    margin: 3em 0;
    text-align: center;
}

figcaption {
    color: #7f8c8d;
    font-size: 0.9em;
    margin-top: 0.8em;
    font-weight: 500;
}

img {
    max-width: 100%;
    height: auto;
    border-radius: 6px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}

img:hover {
    transform: scale(1.01);
}
EOF

echo "Economics Educational Environment initialized with Sora Persona."